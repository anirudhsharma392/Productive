import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:productivity/common/utils/icons.dart';
import 'package:productivity/common/utils/utils.dart';
import 'package:productivity/controller/add_habit/add_habit.dart';
import 'package:productivity/controller/central_state.dart';
import 'package:productivity/model/habit.dart';
import 'package:productivity/style/style.dart';
import 'package:productivity/view/common_widgets/app_bar.dart';
import 'package:productivity/view/common_widgets/common_widgets.dart';

import 'add_habit_widgets.dart';

AddHabit addHabitController;

class AddHabitPage extends StatefulWidget {
  static const route = 'add_habit_home/add_habit_page';

  @override
  _AddHabitPageState createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addHabitController = new AddHabit();
  }

  final double _ht1 = centralState.getHeight(6.5);

  final double _ht2 = centralState.getHeight(5.5);

  Time _extractTime() {
    final _today = Date.getCurrentDate();

    ///time conditions
    Time _time = new Time(
        isOneTimeTask: false,
        repeat: addHabitController.repeatHabit,
        doWhen: addHabitController.doWhen,
        reminderTime: List.generate(addHabitController.timeList.length,
            (index) => addHabitController.timeList[index]));
    //repeat conditions
    _time.repeat = addHabitController.repeatHabit;

    _time.occurrences = [];

    ///---------------- for daily----------------
    if (addHabitController.repeatHabit == 'daily') {
      ///adds up the selected days of the week
      _time.selectedDays = List.generate(addHabitController.selectedDays.length,
          (index) => addHabitController.selectedDays[index]);
    }

    ///---------------- for weekly----------------
    else if (addHabitController.repeatHabit == 'weekly') {
      _time.selectedWeek = addHabitController.selectedWeek;

      //condition for repeating task in every two week
      if (_time.selectedWeek == 0) {
        //[100] next habits are generated
        _time.occurrences = List.generate(100, (index) {
          return _today.add(Duration(days: (index * 14) + 2));
        });
      } else {
        for (int i = 0; i < 100; i++) {
          DateTime _start = _today.add(Duration(days: i * 7));
          DateTime _end = _today.add(Duration(days: (i + 1) * 7));

          _time.occurrences
              .addAll(Date.getRandomDays(_start, _end, _time.selectedWeek));
        }
      }
    }

    ///---------------- for monthly----------------
    else {
      _time.selectedMonth = addHabitController.selectedMonth;
      int _selectedMonth;
      if (_time.selectedMonth == 0) {
        _selectedMonth = Random().nextInt(4);
      } else {
        _selectedMonth = _time.selectedMonth;
      }

      DateTime _lastDate = _today;
      if (_selectedMonth == 2) {
        //case for selecting middle day of the month

        for (DateTime day = _today;
            day.year <= _today.add(Duration(days: 356 * 3)).year;
            day = day.add(Duration(days: 10))) {
          if (day.day >= 10 && day.day < 20) {
            _time.occurrences.add(day);
          }
        }
      } else {
        //case for selecting starting and ending day of the month
        for (DateTime day = _today;
            day.year <= _today.add(Duration(days: 356 * 3)).year;
            day = day.add(Duration(days: 7))) {
          if (_lastDate.month != day.month) {
            if (_selectedMonth == 1) {
              _time.occurrences.add(day);
            } else if (_selectedMonth == 3) {
              _time.occurrences.add(_lastDate);
            }
          }
          _lastDate = day;
        }
      }
    }

    return _time;
  }

  /// saves the habit into the list of habits as a [Habit] object

  void _saveHabit() {
    /// TODO : change it later for one time task

    Habit _habit = new Habit(
        name: addHabitController.habitName,
        icons: addHabitController.themeIconIndex,
        color: addHabitController.themeColorIndex,
        goal: addHabitController.selectedFrequencyAKAGoal,
        time: _extractTime());
    centralState.habitList.add(_habit);
    Navigator.of(context).pop();
    print(_habit.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(centralState.getHeight(15)),
              child: AppBarCustom(
                leading: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: iconColor,
                  ),
                ),
                defaultTitleText: 'New Habit',
                trailing: Observer(
                    builder: (_) => GestureDetector(
                          onTap: _saveHabit,
                          child: Text(
                            'Done',
                            style: TextStyle(
                                color: AppThemeData
                                    .colors[addHabitController.themeColorIndex],
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                        )),
              )),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: margin * 3),
              child: Column(children: [
                SizedBox(
                  height: marginExtraLarge,
                ),
                HabitNameField(
                  ht: _ht1,
                ),
                SizedBox(
                  height: marginExtraLarge,
                ),
                ChooseThemeOfHabit(
                  ht: _ht1,
                ),
                TextDivider(
                  topMargin: marginExtraLarge,
                  text: "I want to set a goal",
                ),
                HabitFrequency(
                  ht: _ht2,
                ),
                TextDivider(
                  topMargin: marginExtraLarge * 2,
                  text: "I want to repeat my habit",
                ),
                HabitRepeat(_ht2),
                TextDivider(
                  topMargin: marginExtraLarge * 2,
                  text: "On these days",
                ),
                HabitDurationSelector(_ht2),
                TextDivider(
                  topMargin: marginExtraLarge * 2,
                  text: "I will prefer to do this in the",
                ),
                DoWhen(_ht2),
                TextDivider(
                  topMargin: marginExtraLarge * 2,
                  text: "Remind me about this at",
                ),
                SelectTime(_ht1),
                SizedBox(
                  height: _ht1,
                )
              ]),
            ),
          )),
    );
  }
}
