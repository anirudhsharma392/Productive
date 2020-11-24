class Habit {
  String name;
  int color;
  int icons;
  int goal;
  Location location;
  Time time;

  Habit(
      {this.name, this.color, this.icons, this.goal, this.location, this.time});

  Habit.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    color = json['Color'];
    icons = json['Icons'];
    goal = json['Goal'];
    location = json['Location'] != null
        ? new Location.fromJson(json['Location'])
        : null;
    time = json['Time'] != null ? new Time.fromJson(json['Time']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Color'] = this.color;
    data['Icons'] = this.icons;
    data['Goal'] = this.goal;
    if (this.location != null) {
      data['Location'] = this.location.toJson();
    }
    if (this.time != null) {
      data['Time'] = this.time.toJson();
    }
    return data;
  }
}

class Location {
  double latitude;
  double longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class Time {
  bool isOneTimeTask = false;
  List<DateTime> reminderTime;
  List<DateTime> occurrences;
  String repeat;
  List<int> selectedDays;
  int selectedWeek;
  int selectedMonth;
  String doWhen;

  Time({this.isOneTimeTask = false,
    this.reminderTime,
    this.repeat,
    this.selectedDays,
    this.selectedWeek,
    this.selectedMonth,
    this.occurrences,
    this.doWhen});

  Time.fromJson(Map<String, dynamic> json) {
    isOneTimeTask = json['IsOneTimeTask'];
    reminderTime = json['reminderTime'].cast<String>();
    occurrences = json['Occurrences'].cast<String>();
    repeat = json['Repeat'];
    selectedDays = json['SelectedDays'].cast<int>();
    selectedWeek = json['SelectedWeek'];
    selectedMonth = json['SelectedMonth'];
    doWhen = json['PreferredTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IsOneTimeTask'] = this.isOneTimeTask;
    data['reminderTime'] = this.reminderTime;
    data['Occurrences'] = this.occurrences;
    data['Repeat'] = this.repeat;
    data['SelectedDays'] = this.selectedDays;
    data['SelectedWeek'] = this.selectedWeek;
    data['SelectedMonth'] = this.selectedMonth;
    data['PreferredTime'] = this.doWhen;
    return data;
  }
}

