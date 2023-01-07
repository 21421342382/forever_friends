import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class Home extends StatefulWidget {
  Home({Key? key,}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  var index_ = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage("assets/Theme Background 2.png"),
    fit: BoxFit.fill)),


        ),
    bottomNavigationBar: BottomNavyBar(
      containerHeight: 72.0,
      selectedIndex: index_,
      showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (index) => setState(() {
        index_ = index;

      }),
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text('Message'),
          activeColor: Color(0xFF3A6279),
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.gamepad),
            title: Text('Games'),
            activeColor: Colors.indigo
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.group_outlined),
            title: Text('Community'),
            activeColor: Colors.pink
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.live_tv),
            title: Text('Live'),
            activeColor: Colors.blue
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
            activeColor: Color(0xFF3A6279)
        ),
      ],
    ),
    );
  }
}

