import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uia/Models/news.dart';
import 'package:uia/childs/Views/NewsView.dart';

class EmadingWidget extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('E-Mading'),
          centerTitle: true,
          backgroundColor: Colors.green),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('emading').snapshots(),
        builder: (context, snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else
            return ListView(
              children: snapshot.data!.docs.map((doc) {
                var news = News.fromMap(doc.data(), doc.id);
                return NewsTile(news: news!);
              }).toList(),
            );
        },
      ),
    );
  }
}
