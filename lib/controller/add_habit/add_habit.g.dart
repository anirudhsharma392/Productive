// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_habit.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddHabit on AddHabitBase, Store {
  final _$themeColorIndexAtom = Atom(name: 'AddHabitBase.themeColorIndex');

  @override
  int get themeColorIndex {
    _$themeColorIndexAtom.reportRead();
    return super.themeColorIndex;
  }

  @override
  set themeColorIndex(int value) {
    _$themeColorIndexAtom.reportWrite(value, super.themeColorIndex, () {
      super.themeColorIndex = value;
    });
  }

  final _$themeIconIndexAtom = Atom(name: 'AddHabitBase.themeIconIndex');

  @override
  int get themeIconIndex {
    _$themeIconIndexAtom.reportRead();
    return super.themeIconIndex;
  }

  @override
  set themeIconIndex(int value) {
    _$themeIconIndexAtom.reportWrite(value, super.themeIconIndex, () {
      super.themeIconIndex = value;
    });
  }

  final _$selectedFrequencyAKAGoalAtom =
      Atom(name: 'AddHabitBase.selectedFrequencyAKAGoal');

  @override
  int get selectedFrequencyAKAGoal {
    _$selectedFrequencyAKAGoalAtom.reportRead();
    return super.selectedFrequencyAKAGoal;
  }

  @override
  set selectedFrequencyAKAGoal(int value) {
    _$selectedFrequencyAKAGoalAtom
        .reportWrite(value, super.selectedFrequencyAKAGoal, () {
      super.selectedFrequencyAKAGoal = value;
    });
  }

  final _$repeatHabitAtom = Atom(name: 'AddHabitBase.repeatHabit');

  @override
  String get repeatHabit {
    _$repeatHabitAtom.reportRead();
    return super.repeatHabit;
  }

  @override
  set repeatHabit(String value) {
    _$repeatHabitAtom.reportWrite(value, super.repeatHabit, () {
      super.repeatHabit = value;
    });
  }

  final _$selectedDaysAtom = Atom(name: 'AddHabitBase.selectedDays');

  @override
  ObservableList<dynamic> get selectedDays {
    _$selectedDaysAtom.reportRead();
    return super.selectedDays;
  }

  @override
  set selectedDays(ObservableList<dynamic> value) {
    _$selectedDaysAtom.reportWrite(value, super.selectedDays, () {
      super.selectedDays = value;
    });
  }

  final _$selectedWeekAtom = Atom(name: 'AddHabitBase.selectedWeek');

  @override
  int get selectedWeek {
    _$selectedWeekAtom.reportRead();
    return super.selectedWeek;
  }

  @override
  set selectedWeek(int value) {
    _$selectedWeekAtom.reportWrite(value, super.selectedWeek, () {
      super.selectedWeek = value;
    });
  }

  final _$selectedMonthAtom = Atom(name: 'AddHabitBase.selectedMonth');

  @override
  int get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(int value) {
    _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
      super.selectedMonth = value;
    });
  }

  final _$doWhenAtom = Atom(name: 'AddHabitBase.doWhen');

  @override
  String get doWhen {
    _$doWhenAtom.reportRead();
    return super.doWhen;
  }

  @override
  set doWhen(String value) {
    _$doWhenAtom.reportWrite(value, super.doWhen, () {
      super.doWhen = value;
    });
  }

  final _$timeListAtom = Atom(name: 'AddHabitBase.timeList');

  @override
  ObservableList<dynamic> get timeList {
    _$timeListAtom.reportRead();
    return super.timeList;
  }

  @override
  set timeList(ObservableList<dynamic> value) {
    _$timeListAtom.reportWrite(value, super.timeList, () {
      super.timeList = value;
    });
  }

  final _$AddHabitBaseActionController = ActionController(name: 'AddHabitBase');

  @override
  void addTimeList(DateTime item) {
    final _$actionInfo = _$AddHabitBaseActionController.startAction(
        name: 'AddHabitBase.addTimeList');
    try {
      return super.addTimeList(item);
    } finally {
      _$AddHabitBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTimeList(int index) {
    final _$actionInfo = _$AddHabitBaseActionController.startAction(
        name: 'AddHabitBase.removeTimeList');
    try {
      return super.removeTimeList(index);
    } finally {
      _$AddHabitBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeColorIndex: ${themeColorIndex},
themeIconIndex: ${themeIconIndex},
selectedFrequencyAKAGoal: ${selectedFrequencyAKAGoal},
repeatHabit: ${repeatHabit},
selectedDays: ${selectedDays},
selectedWeek: ${selectedWeek},
selectedMonth: ${selectedMonth},
doWhen: ${doWhen},
timeList: ${timeList}
    ''';
  }
}
