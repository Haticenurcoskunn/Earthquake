import 'package:deprem_app/models/deprem_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MapForEarthquake());

class MapForEarthquake extends StatefulWidget {
  @override
  _MapForEarthquakeState createState() => _MapForEarthquakeState();
}

class _MapForEarthquakeState extends State<MapForEarthquake> {
  late GoogleMapController mapController;

  static final LatLng _center = LatLng(
      double.parse(snapshot.data![index].enlem),
      double.parse(snapshot.data![index].boylam));
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  LatLng _lastMapPosition = _center;

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed(
    AsyncSnapshot<List<Deprem>> snapshot,
    int index,
  ) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_lastMapPosition.toString()),
        position: LatLng(double.parse(snapshot.data![index].enlem),
            double.parse(snapshot.data![index].boylam)),
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
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
                target: _center,
                zoom: 10,
              ),
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            FloatingActionButton(
              onPressed: () => _onAddMarkerButtonPressed,
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
