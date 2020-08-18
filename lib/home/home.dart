import 'package:flutter/material.dart';
import 'package:productivity/style/style.dart';
import 'bottom_navigation_bar/bottom_navigation_bar.dart';
import 'calender/calender.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: backgroundColor1,
        bottomNavigationBar: _bottomNavBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              HorizontalCalendar(
                width: _size.width,
                height: 50,
              )
            ],
          ),
        ));
  }

  Widget _bottomNavBar() {
    Widget _icon({String image, String label, int value}) => Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              image,
              height: _selected == value ? 40 : 30,
              color: _selected == value ? selectedIconColor : iconColor,
            ),
            if (_selected != value)
              Text(
                label,
                style: TextStyle(
                    color: iconColor,
                    fontSize: labelFontSize,
                    fontWeight: FontWeight.w600),
              ),
            if (_selected != value)
              SizedBox(
                height: 12,
              )
          ],
        );
    return CurvedNavigationBar(
      buttonBackgroundColor: highlightColor,
      backgroundColor: backgroundColor1,
      color: backgroundColor2,
      height: 60,
      items: <Widget>[
        _icon(label: "Today", image: "assets/icons/today.png", value: 0),
        _icon(label: "Add", image: "assets/icons/add.png", value: 1),
        _icon(label: "Habit", image: "assets/icons/habit.png", value: 2),
      ],
      onTap: (index) {
        //Handle button tap
        setState(() {
          _selected = index;
        });
      },
    );
  }
}

