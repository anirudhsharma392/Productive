
import 'package:mobx/mobx.dart';


part 'add_habit.g.dart';

class AddHabit = AddHabitBase with _$AddHabit;

abstract class AddHabitBase with Store {

  //habit name
  String habitName;

  ///selected theme for habit
  // these values contains index of selected value from the list present in [AppThemeData]
  @observable
  int themeColorIndex = 0;
  @observable
  int themeIconIndex = 0;

  ///repeat tasks frequency in a day
  // [0] means frequency not set
  @observable
  int selectedFrequencyAKAGoal = 0;

  ///select when to repeat habit [daily], [weekly] or [monthly]
  @observable
  String repeatHabit = 'daily';

  //select which day to repeat habit
  ///for daily it is [] {empty list}
  //for monday it is 1 and so on... till 7 which is sunday.It's acc. to ISO standards.
  @observable
  ObservableList selectedDays = ObservableList<int>.of([]);

  //select how many days in a week to repeat
  //for repeating a day in two weeks it's  0
  //for 1 day a week it's 1 and so on... till 4
  @observable
  int selectedWeek = 0;
  //select to repeat in a month
  //for repeating anytime it's  0
  //for repeating in a start of a month it's 1, in a middle it's 2 and in the end its 3
  @observable
  int selectedMonth = 0;

  ///select when to do the task
  ///coded: [anytime], [morning], [afternoon], [evening]
  @observable
  String doWhen = 'anytime';

  ///select time for the task
  @observable
  ObservableList timeList = ObservableList<DateTime>.of([]);

  @action
  void addTimeList(DateTime item)=>timeList.add(item);

  @action
  void removeTimeList(int index)=>timeList.removeAt(index);


}




///RUN TO REFRESH
///if you update state management variable
///flutter packages pub run build_runner build
///OR
///flutter packages pub run build_runner build --delete-conflicting-outputs
