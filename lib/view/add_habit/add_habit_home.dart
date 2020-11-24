import 'package:flutter/material.dart';
import 'package:productivity/controller/central_state.dart';
import 'package:productivity/style/style.dart';
import 'package:productivity/view/add_habit/add_habit_page/add_habit_page.dart';
import 'package:productivity/view/common_widgets/common_widgets.dart';

import '../common_widgets/app_bar.dart';

class AddHabitHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          AppBarCustom(
            defaultTitleText: "Create a habit",
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: margin*1.5),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextDivider(
                    topMargin: margin * 1.5,
                  ),
                  card(context: context),
                  card(
                      context: context,
                      text: "One time task",
                      icon: Icons.cloud_done,
                      color: purple),
                  TextDivider(
                    topMargin: margin * 1.5,
                    text: "Or just quickly add from here",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget card(
          {IconData icon, Color color, String text, BuildContext context}) =>
      GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(AddHabitPage.route),
        child: Container(
            margin: EdgeInsets.only(top: margin * 1.5),
            padding: EdgeInsets.symmetric(
                vertical: margin, horizontal: margin * 2),
            decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(borderRadius)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon ?? Icons.date_range,
                  color: color ?? blue,
                  size: iconSize,
                ),
                SizedBox(
                  width: margin * 2,
                ),
                Text(text ?? "Regular Habit", style: cardFontStyle)
              ],
            )),
      );
}
