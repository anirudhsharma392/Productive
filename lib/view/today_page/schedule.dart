import 'package:flutter/material.dart';
import 'package:productivity/style/style.dart';
import 'package:productivity/view/today_page/task_card.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: margin,
        ),
        TaskCard(),
        TaskCard(),
        TaskCard(),
      ],
    );
  }
}
