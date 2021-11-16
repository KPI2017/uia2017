import 'package:flutter/material.dart';
import 'package:uia/childs/home_widget.dart';
import 'package:uia/childs/learning_widget.dart';
import 'package:uia/childs/more_widget.dart';
import 'childs/home_widget.dart';

class Container_Widget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContainerState();
  }
}

class _ContainerState extends State<Container_Widget> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    HomeWidget(Colors.black87),
    LearningWidget(Colors.deepOrange),
    MoreWidget(Colors.green)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UIA'),
        backgroundColor: Colors.green,
      ),
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        selectedItemColor: Colors.green, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Learning'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz), title: Text('More'))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
