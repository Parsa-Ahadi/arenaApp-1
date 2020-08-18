import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopItemDetailPage extends StatefulWidget {
  final String image;
  final String itemName;
  final String price;
  final String description;

  ShopItemDetailPage({this.price, this.itemName, this.image, this.description});

  static const id = 'ShopItemDetailPage';

  @override
  _ShopItemDetailPageState createState() => _ShopItemDetailPageState();
}

class _ShopItemDetailPageState extends State<ShopItemDetailPage> {
  int _itemNum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b1e44),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              //Item Detail
              Expanded(
                flex: 14,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        height: 300,
                        width: double.infinity,
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned.fill(
                        bottom: 0,
                        top: 300,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.yellow),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(20.0),
                                child: Text(
                                  widget.itemName,
                                  style: GoogleFonts.nunito(
                                      color: Color(0xFF1b1e44),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left : 20.0),
                                child: Text(
                                  '${widget.price}',
                                  style: GoogleFonts.nunito(
                                      color: Color(0xFF1b1e44),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left : 20.0),
                                child: Text(
                                  '${widget.description}',
                                  style: GoogleFonts.nunito(
                                      color: Color(0xFF1b1e44),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              //Button Panel
              Expanded(
                flex: 2,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              if (_itemNum < 0) _itemNum = 0;
                              _itemNum = _itemNum + 1;
                            },
                          );
                        },
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child:Icon(
                              Icons.add,
                              color: Color(0xFF1b1e44),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            (_itemNum == 0 || _itemNum < 0)
                                ? 'Buy'
                                : 'Buy ${_itemNum}',
                            style: GoogleFonts.nunito(
                                color: Color(0xFF1b1e44),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              if (_itemNum < 0) _itemNum = 0;
                              _itemNum = _itemNum - 1;
                            },
                          );
                        },
                        child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child:  Icon(
                              Icons.remove,
                              color: Color(0xFF1b1e44),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
