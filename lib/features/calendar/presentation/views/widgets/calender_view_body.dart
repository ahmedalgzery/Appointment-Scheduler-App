import 'package:appointment/core/utils/meeting_data_source.dart';
import 'package:appointment/core/utils/service.dart';
import 'package:appointment/features/calendar/data/data.dart';
import 'package:appointment/features/calendar/presentation/view_model/meeting_model.dart';
import 'package:appointment/features/calendar/presentation/views/widgets/add_appointment_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// This widget represents the body of the CalendarView.
// It fetches data from Firestore, displays a loading indicator while fetching,
// handles errors if any, and renders the calendar with the retrieved data.

class CalendarViewBody extends StatelessWidget {
  const CalendarViewBody({super.key});

  // Function to fetch data from Firestore
  Future<List<Map<String, dynamic>>> _getData() async {
    List<Map<String, dynamic>> dataList =
        await FirebaseService().fetchDataFromFirestore();
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Display a loading indicator while data is being fetched
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Display an error message if there was an error fetching data
            return Text('Error: ${snapshot.error}');
          } else {
            // Data fetching is complete, retrieve the dataList
            List<Map<String, dynamic>> dataList = snapshot.data!;

            // Use the dataList for further processing or display
            List<Meeting> meetings = [];

            for (var data in dataList) {
              meetings.add(Meeting(
                data['Subject'],
                DateTime.parse(data['StartTime']),
                DateTime.parse(data['EndTime']),
              ));
            }
            return SfCalendar(
              onLongPress: (CalendarLongPressDetails details) {
                CalenderData  myCalendar = CalenderData(
                  endDate: DateFormat('yyyy-MM-dd').format(details.date!),
                  startDate: DateFormat('yyyy-MM-dd').format(details.date!),
                );

                // Show a modal bottom sheet when the calendar is tapped
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  context: context,
                  builder: (context) => AddAppointmentBottomSheet(date: myCalendar),
                );
              },
              view: CalendarView.month,
              monthViewSettings: const MonthViewSettings(
                showAgenda: true,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                appointmentDisplayCount: 3,
              ),
              dataSource: MeetingDataSource(meetings),
            );
          }
        },
      ),
    );
  }
}
