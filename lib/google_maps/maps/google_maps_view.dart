import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  late GoogleMapController mapController;
  static final CameraPosition _cameraPosition = CameraPosition(
      //Harita ekranda ilk açıldığında gelen konumunu ayarlanmasını sağlar.
      // bearing: 192.8334901395799,
      target: LatLng(41.011006, 28.930903), // haritanın başlama yerini belirler
      //  tilt: 59.440717697143555,
      zoom: 19.151926040649414);

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
            myLocationEnabled: true, // mevcut lokasyonu gösterir.
            // trafficEnabled: true, // trafik durumunu gösterir.
            zoomControlsEnabled: false,
            onMapCreated: onMapCreated,
          ),
        ],
      ),
    );
  }
}
