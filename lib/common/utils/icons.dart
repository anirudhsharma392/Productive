import 'dart:math';

import 'package:flutter/material.dart';
import 'package:productivity/style/style.dart';

/// !!!!!!!!! important !!!!!
/// never update any list given below
/// only add element at the end since index are stored to refer the icons and colors that was saved by the user
class AppThemeData {
  static const List<IconData> iconList = [
    Icons.star,
    Icons.cloud,
    Icons.label,
    Icons.build,
    Icons.error,
    Icons.menu,
    Icons.keyboard,
    Icons.settings,
    Icons.print,
    Icons.ac_unit,
    Icons.access_time,
    Icons.add_shopping_cart,
    Icons.airline_seat_individual_suite,
    Icons.airline_seat_recline_normal,
    Icons.airplay,
    Icons.directions_car,
    Icons.card_travel,
    Icons.assistant_photo,
    Icons.attach_money,
    Icons.music_note,
    Icons.block,
    Icons.beach_access,
    Icons.favorite,
    Icons.cake,
    Icons.wb_sunny,
    Icons.mode_comment,
    Icons.whatshot,
    Icons.weekend
  ];

  static const List<Color> colors = [
    blue,
    pink,
    yellow,
    orange,
    purple,
    pink,
    green
  ];

  static T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}
