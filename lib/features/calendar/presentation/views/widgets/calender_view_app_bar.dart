import 'package:appointment/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter/material.dart';

// This widget represents the app bar of the CalendarView.
// It displays the title "Calendar" and an IconButton to navigate to the DashboardView.

class CalendarViewAppBar extends StatelessWidget {
  const CalendarViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        "Calendar",
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Navigate to the DashboardView when the IconButton is pressed
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardView(),
              ),
            );
          },
          icon: const Icon(Icons.dashboard),
        ),
      ],
    );
  }
}
