import 'package:flutter/material.dart';

class FunkoPopDetail {
  final String imageUrl;
  final String price;
  final String title;
  final int tagTitle;
  final Color bgColor;
  final int remainingOfItem;
  final int rating;

  FunkoPopDetail(this.tagTitle,
      {this.imageUrl,
      this.rating,
      this.price,
      this.title,
      this.bgColor,
      this.remainingOfItem});
}

List<FunkoPopDetail> listFunkoPop = [
  FunkoPopDetail(
    1,
    imageUrl: 'images/funko_pop_fortnite_1.png',
    price: '\$ 6.99',
    title: 'Rippley vs Sludge',
    bgColor: Color(0xFFb6deef),
    remainingOfItem: 2,
    rating: 3,
  ),
  FunkoPopDetail(
    2,
    imageUrl: 'images/funko_pop_fortnite_2.png',
    price: '\$ 4.99',
    title: 'P.A.N.D.A \nTeam Leader',
    bgColor: Color(0xFFa6a5a5),
    remainingOfItem: 8,
    rating: 5,
  ),
  FunkoPopDetail(
    3,
    imageUrl: 'images/funko_pop_fortnite_3.png',
    price: '\$ 9.99',
    title: 'Fish Skin',
    bgColor: Color(0xFFff855a),
    remainingOfItem: 22,
    rating: 4,
  ),
  FunkoPopDetail(
    4,
    imageUrl: 'images/funko_pop_fortnite_4.png',
    price: '\$ 14.99',
    title: 'Wild Card',
    bgColor: Color(0xFFe04545),
    remainingOfItem: 8,
    rating: 5,
  )
];
