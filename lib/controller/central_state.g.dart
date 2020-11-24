// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'central_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CentralState on CentralStateBase, Store {
  final _$habitListAtom = Atom(name: 'CentralStateBase.habitList');

  @override
  ObservableList<dynamic> get habitList {
    _$habitListAtom.reportRead();
    return super.habitList;
  }

  @override
  set habitList(ObservableList<dynamic> value) {
    _$habitListAtom.reportWrite(value, super.habitList, () {
      super.habitList = value;
    });
  }

  final _$todayHabitListAtom = Atom(name: 'CentralStateBase.todayHabitList');

  @override
  ObservableList<dynamic> get todayHabitList {
    _$todayHabitListAtom.reportRead();
    return super.todayHabitList;
  }

  @override
  set todayHabitList(ObservableList<dynamic> value) {
    _$todayHabitListAtom.reportWrite(value, super.todayHabitList, () {
      super.todayHabitList = value;
    });
  }

  final _$morningHabitListAtom =
      Atom(name: 'CentralStateBase.morningHabitList');

  @override
  ObservableList<dynamic> get morningHabitList {
    _$morningHabitListAtom.reportRead();
    return super.morningHabitList;
  }

  @override
  set morningHabitList(ObservableList<dynamic> value) {
    _$morningHabitListAtom.reportWrite(value, super.morningHabitList, () {
      super.morningHabitList = value;
    });
  }

  final _$afternoonHabitListAtom =
      Atom(name: 'CentralStateBase.afternoonHabitList');

  @override
  ObservableList<dynamic> get afternoonHabitList {
    _$afternoonHabitListAtom.reportRead();
    return super.afternoonHabitList;
  }

  @override
  set afternoonHabitList(ObservableList<dynamic> value) {
    _$afternoonHabitListAtom.reportWrite(value, super.afternoonHabitList, () {
      super.afternoonHabitList = value;
    });
  }

  final _$eveningHabitListAtom =
      Atom(name: 'CentralStateBase.eveningHabitList');

  @override
  ObservableList<dynamic> get eveningHabitList {
    _$eveningHabitListAtom.reportRead();
    return super.eveningHabitList;
  }

  @override
  set eveningHabitList(ObservableList<dynamic> value) {
    _$eveningHabitListAtom.reportWrite(value, super.eveningHabitList, () {
      super.eveningHabitList = value;
    });
  }

  @override
  String toString() {
    return '''
habitList: ${habitList},
todayHabitList: ${todayHabitList},
morningHabitList: ${morningHabitList},
afternoonHabitList: ${afternoonHabitList},
eveningHabitList: ${eveningHabitList}
    ''';
  }
}
