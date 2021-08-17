import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapForEarthquake extends StatefulWidget {
  List enlemList = [];
  List boylamList = [];
  MapForEarthquake({required this.enlemList, required this.boylamList});
  @override
  MapForEarthquakeState createState() =>
      MapForEarthquakeState(enlemList: enlemList, boylamList: boylamList);
}

class MapForEarthquakeState extends State<MapForEarthquake> {
  List enlemList = [];
  List boylamList = [];
  final Set<Marker> _markers = {};
  MapForEarthquakeState({required this.enlemList, required this.boylamList}) {
    for (var i = 0; i < 20; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: LatLng(enlemList[i], boylamList[i]),
          infoWindow: InfoWindow(
            title: 'Really cool place',
            snippet: '5 Star Rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    }

    _center = LatLng(37.348946, 28.103888);
    _lastMapPosition = _center!;
  }

  late GoogleMapController mapController;

  LatLng? _center;

  void _onMapCreated(GoogleMapController controller) {
    _center = LatLng(37.348946, 28.103888);
    mapController = controller;
  }

  LatLng? _lastMapPosition;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Maps Demo'),
          backgroundColor: Colors.green,
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center!,
                zoom: 10,
              ),
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
          ],
        ),
      ),
    );
  }
}
