import 'package:flutter/material.dart';
import 'package:uia/childs/Views/MenuItemView.dart';

class Fakultas {
  final String title;
  List<String> contents = [];
  final IconData icon;

  Fakultas(this.title, this.contents, this.icon);
}

class FakultasView extends StatelessWidget {
  FakultasView();
  _buildExpandableContent(Fakultas fakultas) {
    List<Widget> columnContent = [];

    for (String content in fakultas.contents)
      columnContent.add(MenuItemView(
        title: content,
        posturl:
            "https://firebasestorage.googleapis.com/v0/b/kpi-uia.appspot.com/o/silabuskpi.pdf?alt=media&token=279443df-0633-40d7-a102-d900f04cd2fe",
        iconData: Icons.school,
        destinationView: DestinationView.fakultasContent,
        subtitle: "",
      ));

    return columnContent;
  }

  List<Fakultas> vehicles = [
    new Fakultas(
      'KPI',
      ['Dosen', 'Silabus', 'E-Mading', 'Visi dan Misi'],
      Icons.school,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Komunikasi Penyiaran Islam'),
        backgroundColor: Colors.green,
      ),
      body: new ListView.builder(
        itemCount: vehicles.length,
        itemBuilder: (context, i) {
          if (vehicles[i].contents.isEmpty) {
            return MenuItemView(
              title: vehicles[i].title,
              posturl:
                  "https://firebasestorage.googleapis.com/v0/b/kpi-uia.appspot.com/o/silabuskpi.pdf?alt=media&token=279443df-0633-40d7-a102-d900f04cd2fe",
              iconData: Icons.school,
              destinationView: DestinationView.fakultasContent,
              subtitle: "",
            );
          } else {
            return new ExpansionTile(
              title: new Text(vehicles[i].title),
              subtitle: new Text(""),
              leading: Icon(vehicles[i].icon),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: new Column(
                    children: _buildExpandableContent(vehicles[i]),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
