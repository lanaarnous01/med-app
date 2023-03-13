import 'package:flutter/material.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  Task(
      {this.iconColor, this.title, this.bgColor, this.btnColor, this.iconData});
  static List<Task> generateTasks() {
    return [
      Task(
        iconData: Icons.monitor_heart,
        title: 'Heart rate',
        bgColor: Colors.amber,
        iconColor: Colors.amberAccent,
        btnColor: Colors.amberAccent,
      )
    ];
  }
}
