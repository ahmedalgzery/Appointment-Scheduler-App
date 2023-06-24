import 'package:appointment/features/calendar/presentation/views/calendar_view.dart';
import 'package:flutter/material.dart';

class DashboardViewAppBar extends StatelessWidget {
  const DashboardViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
      return AppBar(
      // Disabling the leading icon button
      automaticallyImplyLeading: false,
      
      // Setting the title of the app bar
      title: const Text('Dashboard'),
      
      // Adding an action button to the app bar
      actions: [
        IconButton(
          onPressed: () {
            // Navigating to the CalendarView when the icon button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CalenderView(),
              ),
            );
          },
          icon: const Icon(Icons.calendar_month),
        ),
      ],
    );
  }
}
