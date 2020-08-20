import 'dart:math';

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
    return Scaffold(
        backgroundColor: backgroundColor1,
        bottomNavigationBar: _bottomNavBar(),
        body: SafeArea(
          child: Column(
            children: [
              Calendar(),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(borderRadius),
                                bottomRight: Radius.circular(borderRadius))),
                        expandedHeight: 150.0,
                        floating: false,
                        backgroundColor: backgroundColor3,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                            centerTitle: true,
                            title: Text("Collapsing Toolbar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                )),
                            background: Image.network(
                              "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                              fit: BoxFit.cover,
                            )),
                      ),
                    ];
                  },
                  body: HomePage(),
                ),
              ),
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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<double> _notifier;

  @override
  void dispose() {
    _notifier?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _notifier = ValueNotifier<double>(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drag and rotate!"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: NotifyingPageView(
                notifier: _notifier,
              ),
            ),
            Center(
              child: AnimatedBuilder(
                animation: _notifier,
                builder: (context, _) {
                  print(_notifier.value);
                  return Transform.rotate(
                    angle: 2 * pi * _notifier.value,
                    child: Container(
                      color: Colors.blue,
                      width: 200,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          Text(
                            "TOP",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotifyingPageView extends StatefulWidget {
  final ValueNotifier<double> notifier;

  const NotifyingPageView({Key key, this.notifier}) : super(key: key);

  @override
  _NotifyingPageViewState createState() => _NotifyingPageViewState();
}

class _NotifyingPageViewState extends State<NotifyingPageView> {
  int _previousPage;
  PageController _pageController;

  void _onScroll() {
    // Consider the page changed when the end of the scroll is reached
    // Using onPageChanged callback from PageView causes the page to change when
    // the half of the next card hits the center of the viewport, which is not
    // what I want

    if (_pageController.page.toInt() == _pageController.page) {
      _previousPage = _pageController.page.toInt();
    }
    widget.notifier?.value = _pageController.page - _previousPage;
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.9,
    )..addListener(_onScroll);

    _previousPage = _pageController.initialPage;
    super.initState();
  }

  List<Widget> _pages = List.generate(
    3,
    (index) {
      return Container(
        height: 30,
        width: 40,
        alignment: Alignment.center,
        color: Colors.lightBlue,
        child: Text(
          "Card number $index",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      allowImplicitScrolling: true,
      children: _pages,
      controller: _pageController,
    );
  }
}
