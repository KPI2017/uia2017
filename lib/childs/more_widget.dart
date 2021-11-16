import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uia/childs/Views/MenuItemView.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreWidget extends StatelessWidget {
  final Color color;
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);
  static final LatLng _kMapCenter = LatLng(-6.26070, 106.91016);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 18.0, tilt: 0, bearing: 0);

  MoreWidget(this.color);

  Set<Marker> _createMarker() {
    return {
      Marker(
          markerId: MarkerId("marker_1"),
          position: _kMapCenter,
          infoWindow: InfoWindow(title: 'UIA Campus'))
    };
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: [
              Container(
                height: 350,
                child: GoogleMap(
                  markers: _createMarker(),
                  initialCameraPosition: _kInitialPosition,
                ),
              ),
              MenuItemView(
                title: "Visi & Misi",
                posturl: 'https://uia.ac.id/home/sejarah-uia/visi',
                iconData: Icons.visibility,
                destinationView: DestinationView.webview,
                subtitle: "Our vision and mision for future",
              ),
              MenuItemView(
                title: "Sejarah UIA",
                posturl: "https://uia.ac.id/home/sejarah-uia",
                iconData: Icons.history,
                destinationView: DestinationView.webview,
                subtitle: "History of UIA",
              ),
              MenuItemView(
                  title: "Rate this App",
                  subtitle: "Help us improve the app.",
                  posturl: "",
                  iconData: Icons.star_rate,
                  destinationView: DestinationView.rate),
              MenuItemView(
                  title: "Phone",
                  subtitle: "(+62)87783223999",
                  posturl: "tel://+6287783223999",
                  iconData: Icons.phone_android,
                  destinationView: DestinationView.url),
              MenuItemView(
                  title: "Email",
                  subtitle: "info@uia.ac.id",
                  posturl: "mailto:info@uia.ac.id?subject=UIA%20Info",
                  iconData: Icons.mail,
                  destinationView: DestinationView.url),
              // Column(
              //   children: [
              //     new IconTheme(
              //       data: new IconThemeData(color: Colors.blue),
              //       child: new Icon(Icons.phone_android),
              //     ),
              //     SizedBox(height: 8),
              //     FlatButton(
              //         onPressed: () => launch("tel://+6287783223999"),
              //         child: new Text("+6287783223999")),
              //   ],
              // ),
              // Column(children: [
              //   new IconTheme(
              //     data: new IconThemeData(color: Colors.blue),
              //     child: new Icon(Icons.mail),
              //   ),
              //   SizedBox(height: 8),
              //   FlatButton(
              //       onPressed: () =>
              //           launchUrl("mailto:info@uia.ac.id?subject=UIA%20Info"),
              //       child: new Text("info@uia.ac.id")),
              // ]),
            ],
          ),
        )
      ],
    );
  }
}
