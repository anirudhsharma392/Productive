class Date {
  getCurrentDate() {
    DateTime _currentTime = DateTime.now();
    return DateTime(_currentTime.year, _currentTime.month, _currentTime.day);
  }
}
