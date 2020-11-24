import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:productivity/controller/central_state.dart';
import 'package:productivity/controller/home/home_controller.dart';
import 'package:productivity/style/style.dart';
import 'package:productivity/view/add_habit/add_habit_home.dart';
import 'package:productivity/view/today_page/today.dart';

import 'bottom_navigation_bar/bottom_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ///initializes the constraints
    centralState.initConstraints(MediaQuery.of(context).size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundLight,
        bottomNavigationBar: BottomNavBar(),
        body: PageView(
          controller: homeController.pageController,
          onPageChanged: (index) {
            homeController.setCurrentPage(index);
          },
          children: [TodayPage(), AddHabitHome(), Container()],
        ));
  }
}

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => CurvedNavigationBar(
          index: homeController.currentPage,
          buttonBackgroundColor: highlightColor,
          backgroundColor: backgroundLight,
          color: backgroundColorMedium,
          height: 60,
          items: <Widget>[
            _icon(label: "Today", image: "assets/icons/today.png", value: 0),
            _icon(label: "Add", image: "assets/icons/add.png", value: 1),
            _icon(label: "Habit", image: "assets/icons/habit.png", value: 2),
          ],
          onTap: (index) async {
            print(index);
            homeController.setCurrentPage(index);
            homeController.jumpToPage(index);
          }),
    );
  }

  Widget _icon({String image, String label, int value}) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset(
            image,
            height: homeController.currentPage == value ? 40 : 30,
            color: homeController.currentPage == value
                ? selectedIconColor
                : iconColor,
          ),
          if (homeController.currentPage != value)
            Text(
              label,
              style: TextStyle(
                  color: iconColor,
                  fontSize: labelFontSize,
                  fontWeight: FontWeight.w600),
            ),
          if (homeController.currentPage != value)
            SizedBox(
              height: 12,
            )
        ],
      );
}
