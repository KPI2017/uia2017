import 'package:flutter/material.dart';
import 'package:uia/childs/Views/FakultasView.dart';

import 'Views/MenuItemView.dart';

class LearningWidget extends StatelessWidget {
  final Color color;
  _buildExpandableContent(Fakultas fakultas) {
    List<Widget> columnContent = [];

    for (String content in fakultas.contents)
      columnContent.add(MenuItemView(
        title: content,
        posturl:
            'https://firebasestorage.googleapis.com/v0/b/uia-kpi.appspot.com/o/Silabus%20KPI.pdf?alt=media&token=44a38671-8406-48d5-8043-5d792f5bb5a0',
        iconData: Icons.school,
        destinationView: DestinationView.fakultasContent,
        subtitle: "",
      ));

    return columnContent;
  }

  LearningWidget(this.color);
  List<Fakultas> vehicles = [
    new Fakultas(
      'KPI',
      ['Dosen', 'Silabus', 'E-Mading', 'Visi dan Misi'],
      Icons.school,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ExpansionTile(
          title: new Text('Komunikasi Penyiaran Islam'),
          subtitle: new Text(""),
          leading: Icon(Icons.school),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: new Column(
                children: _buildExpandableContent(vehicles[0]),
              ),
            )
          ],
        ),
        MenuItemView(
          title: "Smart Campus",
          posturl: "http://smart.uia.ac.id/",
          iconData: Icons.smart_toy,
          destinationView: DestinationView.webview,
          subtitle: "",
        ),
        MenuItemView(
          title: "Repository",
          posturl: "https://repository.uia.ac.id/",
          iconData: Icons.repeat,
          destinationView: DestinationView.webview,
          subtitle: "",
        ),
        MenuItemView(
          title: "E-Jurnal UIA",
          posturl: "https://uia.e-journal.id/",
          iconData: Icons.leaderboard,
          destinationView: DestinationView.webview,
          subtitle: "",
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
