import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hotel_booking/src/pages/homePage.dart';

class Bottom extends StatefulWidget {
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  var _pageController = PageController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Colors.white,
        buttonBackgroundColor: Colors.blueAccent,
        backgroundColor: HexColor('#D5E2E9').withOpacity(.3),
        animationDuration: Duration(microseconds: 200),
        items: [
          Icon(Icons.home, size: 30, color: Colors.black),
          Icon(Icons.search, size: 30, color: Colors.black),
          Icon(Icons.person, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Homepage(),
          Homepage(),
          Homepage(),
        ],
        onPageChanged: (int index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
