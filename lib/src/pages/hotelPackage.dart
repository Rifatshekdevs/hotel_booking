import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/src/config/colorConfig.dart';
import 'package:hotel_booking/src/model/hotel.dart';
import 'package:hotel_booking/src/widget/ktext.dart';

Widget hotelPackage(int index) {
  final Size size = Get.size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorConfig.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 4.0),
              blurRadius: 10,
            )
          ]),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 130,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: AssetImage(hotels[index].imageUrl),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: size.width * 0.35,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: hotels[index].name,
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Nunito Bold',
                ),
                SizedBox(
                  height: 5,
                ),
                KText(
                  text: hotels[index].description,
                  color: Colors.grey,
                  fontSize: 14,
                  fontFamily: 'Nunito Bold',
                ),
                SizedBox(
                  height: 5,
                ),
                KText(
                  text: '\$${hotels[index].price}/ Night',
                  color: Colors.blueAccent,
                  fontSize: 14,
                  fontFamily: 'Nunito Bold',
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.car,
                        color: Colors.blueAccent,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.hotTub,
                        color: Colors.blueAccent,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.local_bar,
                        color: Colors.blueAccent,
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        FontAwesomeIcons.wifi,
                        color: Colors.blueAccent,
                        size: 25,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: size.width * 0.67,
            child: Center(
              child: Transform.rotate(
                  angle: pi / -2,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 130,
                      child: Center(
                          child: KText(
                        text: 'Booking Now',
                        fontSize: 18,
                        color: Colors.white,
                      )),
                    ),
                  )),
            ),
          ),
        ],
      ),
    ),
  );
}
