import 'package:appointment/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:flutter/material.dart';

class CalenderViewAppBar extends StatelessWidget {
  const CalenderViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text(
        "Calender",
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
