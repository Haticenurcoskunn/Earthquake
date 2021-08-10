import 'package:deprem_app/constants/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:deprem_app/models/deprem_model.dart';

Card buildEarthquakeCard(AsyncSnapshot<List<Deprem>> snapshot, int index) {
  return Card(
    child: ListTile(
      leading: Column(
        children: [
          Text(
            //TODO
            snapshot.data![index].yer,
            style: AppTextStyles().eartquakeCardTextStyle,
          ),
          //TODO
          Text(snapshot.data![index].tarih),
          Text(snapshot.data![index].saat),
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
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: Colors.deepOrange.shade200, width: 6),
    ),
  );
}

AppBar eartquakeListPageAppBar() {
  return AppBar(
    title: Text(
      'Anlık Deprem Bilgisi',
    ),
    backgroundColor: Colors.deepOrange[200],
  );
}
