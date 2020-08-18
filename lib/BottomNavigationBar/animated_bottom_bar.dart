import 'package:flutter/material.dart';

class BarItem {
  String text;
  IconData iconData;
  Color color;

  BarItem({this.text, this.iconData, this.color});
}

//class BarStyle {
//  final double fontSize , iconSize;
//  final FontWeight fontWeight;
//
//  BarStyle({this.fontWeight = FontWeight.w600, this.fontSize = 18 , this.iconSize = 30});
//}

class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  final Duration animationDuration;
  final Function onBarTap;

  const AnimatedBottomBar({
    Key key,
    this.barItems,
    this.animationDuration = const Duration(milliseconds: 500),
    this.onBarTap,
  }) : super(key: key);

//  final BarStyle barStyle;

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 10.0,
          top: 10,
          left: 10,
          right: 10,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = List();

    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem item = widget.barItems[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              selectedBarIndex = i;
              widget.onBarTap(selectedBarIndex);
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              color:
                  isSelected ? item.color.withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  item.iconData,
                  color: isSelected ? item.color : Colors.black,
                  size: 25.0,
                ),
                SizedBox(
                  width: 10,
                ),
                AnimatedSize(
                  curve: Curves.easeInOut,
                  duration: widget.animationDuration,
                  vsync: this,
                  child: Text(
                    isSelected ? item.text : '',
                    style: TextStyle(
                      color: item.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}
