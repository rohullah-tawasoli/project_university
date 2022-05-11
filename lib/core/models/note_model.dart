import 'package:flutter/cupertino.dart';

class Note {
  int id;
  String title;
  String date;
  int rounds;
  int activityMinutes;
  int activitySeconds;
  int restMinutes;
  int restSeconds;

  Note({
    this.id,
    @required this.title,
    @required this.date,
    @required this.rounds,
    @required this.activityMinutes,
    @required this.activitySeconds,
    @required this.restMinutes,
    @required this.restSeconds,
  });

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    date = json['date'];
    rounds = json['rounds'];
    activityMinutes = json['activityMinutes'];
    activitySeconds = json['activitySeconds'];
    restMinutes = json['restMinutes'];
    restSeconds = json['restSeconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> note = Map<String, dynamic>();
    note['id'] = this.id;
    note['title'] = this.title;
    note['date'] = this.date;
    note['rounds'] = this.rounds;
    note['activityMinutes'] = this.activityMinutes;
    note['activitySeconds'] = this.activitySeconds;
    note['restMinutes'] = this.restMinutes;
    note['restSeconds'] = this.restSeconds;
    return note;
  }
}
