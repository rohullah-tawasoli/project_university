import 'package:flutter/cupertino.dart';

class User {
  String imagePath;
  String name;
  String email;
  String about;
  bool isDarkMode;

  User({
    @required this.imagePath,
    @required this.name,
    @required this.email,
    @required this.about,
    @required this.isDarkMode,
  });
}
