import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uia/Models/news.dart';
import 'package:uia/childs/Views/NewsView.dart';

class HomeWidget extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  final Color color;

  HomeWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('News').snapshots(),
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
