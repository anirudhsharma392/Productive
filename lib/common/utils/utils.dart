import 'dart:math';

class Date {
  static DateTime getCurrentDate() {
    DateTime _currentTime = DateTime.now();
    return getDateOnly(_currentTime);
  }

  static DateTime getDateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  ///this function returns the list of [n] dates between two dates
  ///startDate is exclusive and end is inclusive
  ///for eg betweeen 21 and 26 , possible outcomes are 22,23,24,25,26. NOT 21
  static getRandomDays(DateTime startDate, DateTime endDate, int n) {
    print(endDate.difference(startDate).inDays);

    if (endDate.difference(startDate).inDays >= n) {
      List<DateTime> _selectedDays = [];

      while (_selectedDays.length != n) {
        print('looping');
        DateTime _randomDay = getCurrentDate().add(Duration(
            days: Random().nextInt(endDate.difference(startDate).inDays + 1)));
        if (!_selectedDays.contains(_randomDay)) {
          _selectedDays.add(_randomDay);
        }
      }
      return _selectedDays;
    } else {
      print('n');
      return [];
    }
  }
}
