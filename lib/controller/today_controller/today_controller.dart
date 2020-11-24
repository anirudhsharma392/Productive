import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';



part 'today_controller.g.dart';

class TodayController = TodayControllerBase with _$TodayController;

abstract class TodayControllerBase with Store {
  final List<String> eventList = ['All Day', 'Morning', 'Afternoon', 'Evening'];

  TabController tabController ;
}


//instance of a central state
final TodayController todayController = TodayController();

///RUN TO REFRESH
///if you update state management variable
///flutter packages pub run build_runner build
///OR
///flutter packages pub run build_runner build --delete-conflicting-outputs
