import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uia/Models/Dosen.dart';
import 'package:uia/Models/news.dart';
import 'package:uia/childs/Views/NewsView.dart';

import 'DosenView.dart';

class FakultasContentView extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  FakultasContentView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dosen'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('Dosen').snapshots(),
        builder: (context, snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                var dosen = Dosen.fromMap(doc.data(), doc.id);
                return DosenView(dosen: dosen!);
              }).toList(),
            );
        },
      ),
    );
  }
}
