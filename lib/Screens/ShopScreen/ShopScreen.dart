import 'package:arena/Colors/colors.dart';
import 'package:arena/CustomClipper/ShopScreenClipBG.dart';

import 'package:arena/Themes/TextTheme.dart';
import 'package:arena/Utilities/FunkoPopDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Funko_Pop_Detail_Page.dart';
enum Game {
  Fortnite,
  ApexLegends,
  Valorant,
}

class ShopScreen extends StatefulWidget {
  static const id = 'ShopScreen';

  @override
  _ShopScreenState createState() => _ShopScreenState();
}


class _ShopScreenState extends State<ShopScreen> {
  Game selectedGame;
  List<FunkoPopDetail> funkoPops = FunkoPopDetail.listFunkoPop;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: kMainBackGroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20.0, top: 10.0, right: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Items', style: kShopScreenLabelTextStyle),
                      IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          color: kShopScreenTextColor,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 5),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGame = Game.Fortnite;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          decoration: BoxDecoration(
                            color: selectedGame == Game.Fortnite
                                ? kActiveGameItem
                                : kInactiveGameItem,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Text(
                            'Fortnite',
                            style: GoogleFonts.nunito(
                              fontSize: 12.0,
                              color: selectedGame == Game.Fortnite
                                  ? kActiveGameItemColor
                                  : kInctiveGameItemColor,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGame = Game.ApexLegends;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: selectedGame == Game.ApexLegends
                                ? kActiveGameItem
                                : kInactiveGameItem,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Text(
                            'ApexLegends',
                            style: GoogleFonts.nunito(
                              fontSize: 12.0,
                              color: selectedGame == Game.ApexLegends
                                  ? kActiveGameItemColor
                                  : kInctiveGameItemColor,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGame = Game.Valorant;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            color: selectedGame == Game.Valorant
                                ? kActiveGameItem
                                : kInactiveGameItem,
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                          child: Text(
                            'Valorant',
                            style: GoogleFonts.nunito(
                              fontSize: 12.0,
                              color: selectedGame == Game.Valorant
                                  ? kActiveGameItemColor
                                  : kInctiveGameItemColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 20),
                  child: Text(
                    'Funko Pops',
                    style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Container(
                  width: 400,
                  height: 400,
                  padding: EdgeInsets.all(32),
                  child: Swiper(
                    itemCount: funkoPops.length,
                    itemWidth: width - 62 * 2,
                    itemHeight: height - 62 * 2,
                    layout: SwiperLayout.STACK,
                    onTap: (index) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FunkoPopDetailPage(
                            funkoPops[index],
                          ),
                        ),
                      );
                    },
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, a, b) =>
                                  FunkoPopDetailPage(
                                funkoPops[index],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: _buildBackground(index, width - 62 * 2,
                                  kShopScreenFunkoPopTheme),
                            ),
                            Positioned(
                              bottom: 50,
                              left: 50,
                              child: Hero(
                                tag: FunkoPopDetail.listFunkoPop[index].tagTitle,
                                child: Image.asset(
                                  funkoPops[index].imageUrl,
                                  width: 300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackground(int index, double width, TextStyle textStyle) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        color: funkoPops[index].bgColor,
        width: width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 160, left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 125,
                    child: Text(
                      funkoPops[index].title,
                      style: textStyle,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              child: Text(funkoPops[index].price,
                  style: kShopScreenFunkoPopPriceTheme),
            ),
          ],
        ),
      ),
    );
  }
}
