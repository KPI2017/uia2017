import 'package:flutter/material.dart';

import 'Views/MenuItemView.dart';

class LearningWidget extends StatelessWidget {
  final Color color;

  LearningWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        MenuItemView(
          title: "Fakultas",
          posturl: "",
          iconData: Icons.school,
          destinationView: DestinationView.fakultas,
          subtitle: "UIA program studies",
        ),
        MenuItemView(
          title: "Smart Campus",
          posturl: "http://smart.uia.ac.id/",
          iconData: Icons.smart_toy,
          destinationView: DestinationView.webview,
          subtitle: "Be smart with tech",
        ),
        MenuItemView(
          title: "Repository",
          posturl: "https://repository.uia.ac.id/",
          iconData: Icons.repeat,
          destinationView: DestinationView.webview,
          subtitle: "Ton of papers",
        ),
        MenuItemView(
          title: "E-Jurnal UIA",
          posturl: "https://uia.e-journal.id/",
          iconData: Icons.leaderboard,
          destinationView: DestinationView.webview,
          subtitle: "UIA Journal",
        ),
        MenuItemView(
          title: "Gallery Videos",
          posturl: "https://uia.ac.id/home/video",
          iconData: Icons.movie,
          destinationView: DestinationView.webview,
          subtitle: "",
        ),
        MenuItemView(
          title: "Gallery Photos",
          posturl: "https://uia.ac.id/home/photo",
          iconData: Icons.photo,
          destinationView: DestinationView.webview,
          subtitle: "",
        )
      ],
    );
  }
}
