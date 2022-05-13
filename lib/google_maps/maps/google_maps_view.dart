import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'distance.dart';
import 'location_service.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  late String searchAddress;
  late final Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  static final CameraPosition _cameraPosition = CameraPosition(
    //Harita ekranda ilk açıldığında gelen konumunu ayarlanmasını sağlar.
    // bearing: 192.8334901395799,
    target: LatLng(41.011006, 28.930903), // haritanın başlama yerini belirler
    //  tilt: 59.440717697143555,
    zoom: 10,
  );

  List<Marker> _marker = [];
  List<Marker> _list = [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(41.025742, 28.974201),
      infoWindow: InfoWindow(
        title: 'Galata Kulesi',
        snippet: 'Tarihi bir mekan ',
      ),
    ),
    Marker(
      markerId: MarkerId('2'),
      position: LatLng(41.0164, 28.9706),
      infoWindow: InfoWindow(
        title: 'Mısır Çarşısı',
        snippet: 'Tarihi çarşı',
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal, // harita type belirler.
            markers: Set<Marker>.of(_marker),
            initialCameraPosition: _cameraPosition,
            myLocationEnabled: true, // şuanki konumumu gösterir.
            myLocationButtonEnabled: false,
            // trafficEnabled: true, // trafik durumunu gösterir.
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          /* Positioned(
            top: 30.0,
            left: 15.0,
            right: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(1),
              ),
              child: TextField(
                controller: _searchController,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  hintText: 'Burada Arayın',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20.0),
                  suffix: IconButton(
                    icon: Icon(Icons.search),
                    iconSize: 25.0,
                    onPressed: () async {
                      var place = await LocationService()
                          .getPlace(_searchController.text);
                      _goToPlace(place);
                    },
                  ),
                ),
              ),
            ),
          ), */
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Distance()));
            },
            child: Icon(Icons.directions, color: Colors.blue, size: 30),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: getUserLocation,
            child: Image.asset(
              "assets/images/crosshairs-gps.png",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 5),
            child: Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white.withOpacity(1),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 20,
                      top: 16,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 290,
                          child: TextField(
                            controller: _searchController,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Burada Arayın',
                              contentPadding:
                                  EdgeInsets.only(left: 20.0, top: 8),
                              prefixIcon: Icon(Icons.search, size: 25),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF284CF2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              var place = await LocationService()
                                  .getPlace(_searchController.text);
                              _goToPlace(place);
                            },
                            icon:
                                Icon(Icons.done, color: Colors.white, size: 30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(child: Text('Filtreler'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  } // rgb - 26, 155,231

  Future<LatLng?> getUserLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = new Location();
    currentLocation = await location.getLocation();

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 17.0,
      ),
    ));
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 12),
      ),
    );
  }
}
