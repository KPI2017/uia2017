import 'package:flutter/material.dart';
import 'package:uia/container_widget.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(App());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      home: Container_Widget(),
    );
  }
}
