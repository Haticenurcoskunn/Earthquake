import 'dart:convert';
import 'dart:async';
import 'package:deprem_app/models/deprem_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EarthQuakePage extends StatefulWidget {
  const EarthQuakePage({Key? key}) : super(key: key);

  @override
  _EarthQuakePageState createState() => _EarthQuakePageState();
}

class _EarthQuakePageState extends State<EarthQuakePage> {
  Future<List<Deprem>> _verileriGetir() async {
    var response =
        await http.get(Uri.parse("https://turkiyedepremapi.herokuapp.com/api"));

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => (Deprem.fromJson(e)))
          .toList();
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    this._verileriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        title: Text(
          'Anlık Deprem Bilgisi',
        ),
        backgroundColor: Colors.deepOrange[200],
      ),
      body: Center(
        child: FutureBuilder(
          future: _verileriGetir(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Deprem>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Column(
                        children: [
                          Text(
                            snapshot.data![index].yer,
                            style: TextStyle(
                                color: Colors.deepPurple[300],
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(snapshot.data![index].tarih),
                          Text(snapshot.data![index].saat),
                        ],
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("büyüklük:" + snapshot.data![index].buyukluk),
                          Text("derinlik:" + snapshot.data![index].derinlik),
                          Text("enlem:" + snapshot.data![index].enlem),
                          Text("boylam:" + snapshot.data![index].boylam),
                        ],
                      ),
                    ),
                    margin: EdgeInsets.all(20),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.deepOrange.shade200, width: 6)),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
