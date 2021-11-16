import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatelessWidget {
  final String postUrl;
  ArticleView({required this.postUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.green),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Info",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            Text(
              "UIA",
              style:
                  TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
              opacity: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.share))),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: WebView(
        initialUrl: postUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

// class _ArticleViewState extends State<ArticleView> {

//   final Completer<WebViewController> _controller = Completer<WebViewController>();
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }