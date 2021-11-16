import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uia/Models/news.dart';
import 'package:uia/Theme/AppTheme.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  NewsDetail(this.news);

  Widget _headerNews(BuildContext context, News article) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Hero(
          tag: 'headerImage',
          child: article.image == null || article.image.isEmpty
              ? Container()
              : Image.network(
                  article.image,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
        ),
        Container(
          padding: EdgeInsets.only(left: 0, right: 10, bottom: 20, top: 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black87,
                ),
              ),
              Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).backgroundColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).backgroundColor,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _body(BuildContext context, News article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _headerNews(context, article),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(article.judul, style: AppTheme.h1Style),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(article.formatTimestamp() ?? "",
                      style: AppTheme.h6Style),
                  SizedBox(
                    width: 10,
                  ),
                  Text("", style: AppTheme.h6Style),
                ],
              ),
              Divider(
                height: 20,
                thickness: 1,
              ),
              Text(article.deskripsi ?? "", style: AppTheme.h4Style),
              // ListView.builder(
              //   itemCount: news.imageCollections != null ? news.imageCollections?.length : 0,
              //     itemBuilder: (context, i) {
              //       return Container(
              //         color: Colors.greenAccent,
              //   );
              // })
            ],
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _body(
      context,
      news,
    ));
  }
}
