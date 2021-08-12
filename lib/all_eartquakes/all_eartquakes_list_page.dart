import 'package:deprem_app/all_eartquakes/widgets.dart';
import 'package:deprem_app/constants/styles/colors.dart';
import 'package:deprem_app/models/deprem_model.dart';
import 'package:deprem_app/utils/connection/requests/get_all_requests.dart';
import 'package:flutter/material.dart';

class EarthQuakePage extends StatefulWidget {
  const EarthQuakePage({Key? key}) : super(key: key);

  @override
  _EarthQuakePageState createState() => _EarthQuakePageState();
}

class _EarthQuakePageState extends State<EarthQuakePage> {
  @override
  void initState() async {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().primaryPurpleBackgroundColor,
      appBar: eartquakeListPageAppBar(),
      body: Center(
        child: FutureBuilder(
          future: RequestFunctions().getAllEartquakes(context),
          builder:
              (BuildContext context, AsyncSnapshot<List<Deprem>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return buildEarthquakeCard(snapshot, index);
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
