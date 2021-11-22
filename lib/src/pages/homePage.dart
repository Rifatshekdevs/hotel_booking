import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hotel_booking/src/config/colorConfig.dart';
import 'package:hotel_booking/src/model/hotel.dart';
import 'package:hotel_booking/src/pages/detailsPage.dart';
import 'package:hotel_booking/src/pages/hotelPackage.dart';
import 'package:hotel_booking/src/widget/ktext.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      backgroundColor: HexColor('#D5E2E9').withOpacity(.3),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: 'Hello There!',
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    KText(
                      text: 'Find Your Hotel..',
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Nunito Bold',
                    ),
                  ],
                ),
                // profile
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 6.0),
                        blurRadius: 10.0,
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/profile.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // search hotel
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10),
                ],
              ),
              child: Row(
                children: [
                  // search
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      FontAwesomeIcons.search,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: size.width * 0.79,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for hotels',
                          hintStyle: TextStyle(
                            color: Colors.grey.withOpacity(.8),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // catogories
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: KText(
              text: 'Popular Hotel',
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Container(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                Hotel hotel = hotels[index];
                return GestureDetector(
                  onTap: () => Get.to(
                    () => DetailsPage(
                      hotel: hotel,
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 180,
                    width: 170,
                    decoration: BoxDecoration(
                        color: ColorConfig.scafoldBackground,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 5,
                          )
                        ]),
                    child: Column(
                      children: [
                        Hero(
                          tag: hotel.imageUrl,
                          child: Container(
                            height: 120,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              // categories image
                              image: DecorationImage(
                                  image: AssetImage(hotels[index].imageUrl),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        // categories name
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: KText(
                            text: hotels[index].name,
                            fontSize: 15,
                            fontFamily: 'Nunito Black',
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        // categories area
                        KText(
                          text: hotels[index].description,
                          fontSize: 14,
                          fontFamily: 'Nunito Black',
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              KText(
                                text: '\$${hotels[index].price}/ Night',
                                color: Colors.blueAccent,
                              ),
                              Row(
                                children: [
                                  KText(
                                    text: '${hotels[index].rating}',
                                    fontFamily: 'Nunito Black',
                                    color: Colors.blueAccent,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blueAccent,
                                    size: 16,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                KText(
                  text: 'Hotel Package',
                  color: Colors.black,
                  fontFamily: 'Nunito Black',
                  fontSize: 18,
                ),
                KText(
                  text: 'View all',
                  color: Colors.blueAccent,
                  fontSize: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              hotelPackage(0),
              SizedBox(
                height: 10,
              ),
              hotelPackage(1),
              SizedBox(
                height: 10,
              ),
              hotelPackage(2),
              SizedBox(
                height: 10,
              ),
              hotelPackage(3),
              SizedBox(
                height: 10,
              ),
              hotelPackage(4),
            ],
          ),
        ],
      ),
    );
  }
}
