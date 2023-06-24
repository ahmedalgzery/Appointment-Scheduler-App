import 'package:appointment/features/calendar/presentation/view_model/meeting_model.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    // Return the start time of the appointment at the specified index
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    // Return the end time of the appointment at the specified index
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    // Return the subject of the appointment at the specified index
    return appointments![index].eventName;
  }
}
