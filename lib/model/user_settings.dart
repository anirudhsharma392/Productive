class UserSettings {
  String morningTime;
  String afternoonTime;
  String eveningTime;

  UserSettings({this.morningTime, this.afternoonTime, this.eveningTime});

  UserSettings.fromJson(Map<String, dynamic> json) {
    morningTime = json['MorningTime'];
    afternoonTime = json['AfternoonTime'];
    eveningTime = json['EveningTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MorningTime'] = this.morningTime;
    data['AfternoonTime'] = this.afternoonTime;
    data['EveningTime'] = this.eveningTime;
    return data;
  }
}