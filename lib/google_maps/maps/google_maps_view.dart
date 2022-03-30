import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  late String searchAddress;
  late final Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _cameraPosition = CameraPosition(
    //Harita ekranda ilk açıldığında gelen konumunu ayarlanmasını sağlar.
    // bearing: 192.8334901395799,
    target: LatLng(41.011006, 28.930903), // haritanın başlama yerini belirler
    //  tilt: 59.440717697143555,
    zoom: 10,
  );

  @override
  void initState() {
    super.initState();
    Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal, // harita type belirler.
            initialCameraPosition: _cameraPosition,
            myLocationEnabled: true, // şuanki konumumu gösterir.
            myLocationButtonEnabled: false,
            // trafficEnabled: true, // trafik durumunu gösterir.
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
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
                  decoration: InputDecoration(
                    hintText: 'Adres Giriniz:',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 20.0),
                    suffix: IconButton(
                      icon: Icon(Icons.search),
                      iconSize: 25.0,
                      onPressed: () {},
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchAddress = value;
                    });
                  }),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: getUserLocation,
        child: Image.asset(
          "assets/images/crosshairs-gps.png",
        ),
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
}
