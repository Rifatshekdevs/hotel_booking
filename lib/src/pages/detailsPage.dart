import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/src/model/hotel.dart';
import 'package:hotel_booking/src/widget/ktext.dart';

class DetailsPage extends StatefulWidget {
  final Hotel? hotel;
  DetailsPage({this.hotel});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = Get.size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: size.height * 0.40,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  )
                ]),
                child: Hero(
                  tag: widget.hotel!.imageUrl,
                  child: Image(
                    image: AssetImage(widget.hotel!.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                        ),
                      )),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: KText(
              text: widget.hotel!.name,
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Nunito Bold',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 5),
            child: Row(
              children: [
                KText(
                  text: widget.hotel!.description,
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'Nunito Bold',
                ),
                KText(
                  text: '_Show in map',
                  fontSize: 14,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: KText(
              text:
                  'Lyf is a coliving concept that allows digital nomads, technopreneurs, creatives and self-starters to “live your freedom” in a dynamic environment.',
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    KText(
                      text: 'Price',
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    KText(text: '\$${widget.hotel!.price}'),
                  ],
                ),
                Column(
                  children: [
                    KText(
                      text: 'Review',
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: size.width * 0.10),
                          child: KText(text: '${widget.hotel!.rating}'),
                        ),
                        RatingBar.builder(
                          wrapAlignment: WrapAlignment.start,
                          itemSize: 12,
                          initialRating:
                              double.parse('${widget.hotel!.rating}'),
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.blueAccent,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    KText(
                      text: 'Recently booked',
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 20,
                          width: 80,
                        ),
                        Positioned(
                          left: 20,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(hotels[0].imageUrl),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 30,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(hotels[1].imageUrl),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 40,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(hotels[2].imageUrl),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 50,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: KText(
                              text: '+3',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: KText(
              text: 'Animities',
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Nunito Black',
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        FontAwesomeIcons.car,
                        color: Color(0xFF003AAB),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    KText(text: 'parking')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 4.0),
                              blurRadius: 6.0,
                            )
                          ]),
                      child: Icon(
                        FontAwesomeIcons.hotTub,
                        color: Color(0xFF003AAB),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    KText(text: 'Bath')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.local_bar,
                        color: Color(0xFF003AAB),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    KText(text: 'Bar')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        FontAwesomeIcons.wifi,
                        color: Color(0xFF003AAB),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    KText(text: 'Wifi')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.directions_bike,
                        color: Color(0xFF003AAB),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    KText(text: 'Bike')
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.more_horiz,
                        color: Color(0xFF003AAB),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    KText(text: 'More')
                  ],
                ),
              ],
            ),
          ),
          // booking step
          Padding(
            padding: EdgeInsets.only(top: 50, left: 50, bottom: 5),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.favorite_border,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Color(0xFF003AAB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: KText(
                      text: 'Book Now',
                      color: Colors.white,
                      fontSize: 22,
                      fontFamily: 'Nunito Bold',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
