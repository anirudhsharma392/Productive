import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:productivity/model/habit.dart';

part 'central_state.g.dart';

class CentralState = CentralStateBase with _$CentralState;

abstract class CentralStateBase with Store {
  /// Main list that contains all the habits
  @observable
  ObservableList habitList = ObservableList<Habit>.of([]);
  @observable
  ObservableList todayHabitList = ObservableList<Habit>.of([]);
  @observable
  ObservableList morningHabitList = ObservableList<Habit>.of([]);
  @observable
  ObservableList afternoonHabitList = ObservableList<Habit>.of([]);
  @observable
  ObservableList eveningHabitList = ObservableList<Habit>.of([]);

  double widthFactor;
  double heightFactor;

  ///init the ht and wt for dividing screen size into 100X100 ratio
  void initConstraints(Size size) {
    heightFactor = size.height / 100;
    widthFactor = size.width / 100;
  }

  ///returns responsive height
  double getHeight(double ht) {
    return ht * heightFactor;
  }

  ///returns responsive width
  double getWidth(double wt) {
    return wt * heightFactor;
  }
}

//instance of a central state
final CentralState centralState = CentralState();

///RUN TO REFRESH
///if you update state management variable
///flutter packages pub run build_runner build
///OR
///flutter packages pub run build_runner build --delete-conflicting-outputs
