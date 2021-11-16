import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uia/Models/news.dart';
import 'package:uia/childs/Views/FakultasContent.dart';
import 'package:uia/childs/Views/FakultasView.dart';
import 'package:uia/childs/Views/MapLocation.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:uia/childs/Views/NewsDetail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ArticleView.dart';

enum DestinationView {
  webview,
  pdf,
  map,
  rate,
  detail,
  url,
  fakultas,
  pai,
  kpi,
  perbankanSyariah,
  fakultasContent
}

class MenuItemView extends StatelessWidget {
  final String title, posturl, subtitle;
  final IconData iconData;
  final DestinationView destinationView;
  FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  final News? news;

  MenuItemView(
      {required this.title,
      required this.subtitle,
      required this.posturl,
      required this.iconData,
      required this.destinationView,
      this.news = null});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (destinationView == DestinationView.webview) {
            onTappedWebViewContent(context, posturl);
          } else if (destinationView == DestinationView.map) {
            onTappedMapViewContent(context);
          } else if (destinationView == DestinationView.rate) {
            onTappedRatingContent(context);
          } else if (destinationView == DestinationView.detail) {
            onTappedDetail(context);
          } else if (destinationView == DestinationView.url) {
            onTappedUrlContent();
          } else if (destinationView == DestinationView.fakultas) {
            onFakultasTapped(context);
          } else if (destinationView == DestinationView.kpi) {
            onTappedKPI(context);
          } else if (destinationView == DestinationView.pai) {
            onTappedPAI(context);
          } else if (destinationView == DestinationView.perbankanSyariah) {
            onTappedPerbankanSyariah(context);
          } else if (destinationView == DestinationView.fakultasContent) {
            onTappedFakultasContent(context);
          }
        },
        child:
        ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            leading: Icon(iconData)));
  }

  void onTappedFakultasContent(BuildContext context) {
    if (title == "KPI") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FakultasContentView()));
    } else {
      var snackBar = SnackBar(content: Text('Lagi Main Tenis Gan :('));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void onTappedKPI(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FakultasView()));
  }

  void onTappedPAI(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FakultasView()));
  }

  void onTappedPerbankanSyariah(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FakultasView()));
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void onTappedUrlContent() {
    launchUrl(posturl);
  }

  void createRecord(int rate, String comment) async {
    await databaseReference
        .collection("rating")
        .doc()
        .set({'rate': rate, 'comment': comment});
  }

  void onTappedMapViewContent(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MapLocation()));
  }

  void onTappedWebViewContent(BuildContext context, String url) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArticleView(
                  postUrl: url,
                )));
  }

  void onFakultasTapped(BuildContext context) {
    print('object');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FakultasView()));
  }

  void onTappedDetail(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NewsDetail(news!)));
  }

  void onTappedRatingContent(BuildContext context) {
    final _ratingDialog = RatingDialog(
      // ratingColor: Colors.amber,
      title: Text('UIA'),
      // message: 'Rating this app and tell others what you think.'
      //     ' Add more description here if you want.',
      submitButtonText: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');
        createRecord(response.rating.toInt(), response.comment);
        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }
}
