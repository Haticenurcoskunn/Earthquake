import 'package:deprem_app/models/deprem_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapForEarthquake extends StatefulWidget {
  final double lat;
  final double lang;
  MapForEarthquake({required this.lang, required this.lat});
  @override
  MapForEarthquakeState createState() =>
      MapForEarthquakeState(lat: lat, long: lang);
}

class MapForEarthquakeState extends State<MapForEarthquake> {
  final double lat;
  final double long;
  MapForEarthquakeState({required this.lat, required this.long}) {
    _center = LatLng(lat, long);
    _lastMapPosition = _center!;
  }
  late GoogleMapController mapController;

  LatLng? _center;

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _center = LatLng(37.348946, 28.103888);
    mapController = controller;
  }

  LatLng? _lastMapPosition;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: LatLng(widget.lat, widget.lang),
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
      _lastMapPosition = _center;
    });
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
            FloatingActionButton(
              onPressed: () {
                _onAddMarkerButtonPressed();
              },
              materialTapTargetSize: MaterialTapTargetSize.padded,
              backgroundColor: Colors.green,
              child: const Icon(Icons.add_location, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
