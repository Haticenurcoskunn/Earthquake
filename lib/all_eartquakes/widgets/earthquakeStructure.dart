import 'package:deprem_app/constants/styles/text_styles.dart';
import 'package:deprem_app/google_map/google_map_view.dart';
import 'package:flutter/material.dart';
import 'package:deprem_app/models/deprem_model.dart';

GestureDetector buildEarthquakeCard(
  AsyncSnapshot<List<Deprem>> snapshot,
  int index,
  BuildContext context,
) {
  List<double> enlemList = [];
  List<double> boylamList = [];

  return GestureDetector(
      onTap: () {
        for (var i = 0; i < 20; i++) {
          enlemList.add(double.parse(snapshot.data![i].enlem));
        }
        for (var j = 0; j < 20; j++) {
          boylamList.add(double.parse(snapshot.data![j].boylam));
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapForEarthquake(
              boylamList: boylamList,
              enlemList: enlemList,
            ),
          ),
        );
      },
      child: Card(
          child: ListTile(
            leading: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${snapshot.data == null ? '0.0' : snapshot.data![index].yer}",
                  style: AppTextStyles().eartquakeCardTextStyle,
                ),
                Text(
                    "${snapshot.data == null ? '0.0' : snapshot.data![index].tarih}"),
                Text(
                    "${snapshot.data == null ? '0.0' : snapshot.data![index].saat}"),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "büyüklük: ${snapshot.data == null ? '0.0' : snapshot.data![index].buyukluk}"),
                Text(
                    "derinlik:${snapshot.data == null ? '0.0' : snapshot.data![index].derinlik}"),
                Text(
                    "enlem: ${snapshot.data == null ? '0.0' : snapshot.data![index].enlem}"),
                Text(
                    "boylam: ${snapshot.data == null ? '0.0' : snapshot.data![index].boylam}"),
              ],
            ),
          ),
          margin: EdgeInsets.all(20),
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.deepOrange.shade200, width: 6),
          )));
}
