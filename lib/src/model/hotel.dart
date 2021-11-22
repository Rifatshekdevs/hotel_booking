class Hotel {
  String imageUrl;
  String name;
  String description;
  int price;
  double rating;

  Hotel(
      {required this.imageUrl,
      required this.description,
      required this.price,
      required this.rating,
      required this.name});
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel_1.jpg',
    description: 'Coxs Bazar,Ukhia',
    price: 599,
    rating: 4.5,
    name: 'Royal Tulip',
  ),
  Hotel(
    imageUrl: 'assets/images/hotel_2.jpg',
    description: 'Gulshan 2',
    price: 445,
    rating: 4.0,
    name: 'Amari Dhaka Hotel',
  ),
  Hotel(
    imageUrl: 'assets/images/hotel_3.jpg',
    description: 'Airport Road',
    price: 550,
    rating: 3.5,
    name: 'Radisson Blu',
  ),
  Hotel(
    imageUrl: 'assets/images/hotel_4.jpg',
    description: ' Kadamtoli,Chittagong, ',
    price: 750,
    rating: 4.9,
    name: 'Royal Living ',
  ),
  Hotel(
    imageUrl: 'assets/images/hotel_5.jpg',
    description: "Cox's Bazar",
    price: 850,
    rating: 5.0,
    name: 'Muscat Holiday ',
  ),
];
