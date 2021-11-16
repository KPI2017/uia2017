import 'package:flutter/material.dart';
import 'package:uia/Models/Dosen.dart';
import 'package:uia/Models/news.dart';
import 'package:uia/childs/Views/ArticleView.dart';
import 'package:uia/childs/Views/NewsDetail.dart';

import 'DosenDetailView.dart';

class DosenView extends StatelessWidget {
  final Dosen dosen;

  DosenView({required this.dosen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DosenDetailView(dosen: dosen,)));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            dosen.photo,
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        dosen.nama,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 17),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
