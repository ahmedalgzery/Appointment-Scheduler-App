import 'package:appointment/core/utils/functions/get_appointment.dart';
import 'package:appointment/core/utils/meeting_data_source.dart';
import 'package:appointment/features/calendar/data/data.dart';
import 'package:appointment/features/calendar/presentation/views/widgets/add_appointment_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderViewBody extends StatelessWidget {
  const CalenderViewBody({super.key});

  // Function to fetch data from Firestore
  Future<List<Map<String, dynamic>>> _getData() async {
    List<Map<String, dynamic>> dataList = await fetchDataFromFirestore();
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
            
            return SfCalendar(
              onTap: (calendarTapDetails) {
                // Show a modal bottom sheet when the calendar is tapped
                showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  context: context,
                  builder: (context) => const AddAppointmentBottomSheet(),
                );
              },
              view: CalendarView.month,
              monthViewSettings: const MonthViewSettings(
                showAgenda: true,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                appointmentDisplayCount: 3,
              ),
              dataSource: MeetingDataSource(
                getDataSource(
                  endTime: dataList[0]['Subject'],
                  startTime: dataList[0]['StartTime'],
                  subject: dataList[0]['EndTime'],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
