import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/src/widget/bottom.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom(),
    );
  }
}
