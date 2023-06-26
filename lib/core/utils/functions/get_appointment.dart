import 'package:appointment/features/calendar/presentation/view_model/meeting_model.dart';

// Function to generate a list of Meeting objects
List<Meeting> getDataSource({
  required DateTime startTime,
  required DateTime endTime,
  required String subject,
}) {
  final List<Meeting> meetings = <Meeting>[];

  // Create a new Meeting object with the provided subject, start time, end time, and color
  Meeting meeting = Meeting(subject, startTime, endTime);

  // Add the Meeting object to the meetings list
  meetings.add(meeting);

  // Return the list of meetings
  return meetings;
}
