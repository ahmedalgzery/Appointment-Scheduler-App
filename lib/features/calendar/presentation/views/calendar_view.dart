
import 'package:appointment/features/calendar/presentation/views/widgets/calender_view_app_bar.dart';
import 'package:appointment/features/calendar/presentation/views/widgets/calender_view_body.dart';
import 'package:flutter/material.dart';

// This widget represents the CalendarView, which displays a calendar.
// It consists of a CalendarViewAppBar and a CalendarViewBody.

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Column(
        // Adding the CalendarViewAppBar and CalendarViewBody widgets to the column
        children: [
          CalendarViewAppBar(),
          Expanded(child: CalendarViewBody()),
        ],
      ),
    );
  }
}
