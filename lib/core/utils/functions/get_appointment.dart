import 'package:appointment/features/calendar/presentation/view_model/meeting_model.dart';
import 'package:flutter/material.dart';

List<Meeting> getDataSource({
  required String startTime,
  required String endTime,
  required String subject,
}) {
  final List<Meeting> meetings = <Meeting>[];

  // Create a new Meeting object with the provided subject, start time, end time, and color
  // Add the Meeting object to the meetings list
  meetings.add(Meeting(subject, startTime, endTime, Colors.deepPurple));

  // Return the list of meetings
  return meetings;
}

