import 'package:flutter/material.dart';

class Meeting {
  Meeting(
    this.eventName,
    this.from,
    this.to,
    this.background,
  );

  String eventName;
  String from;
  String to;
  Color background;
}
