import 'package:appointment/features/calendar/presentation/views/widgets/calender_view_app_bar.dart';
import 'package:appointment/features/calendar/presentation/views/widgets/calender_view_body.dart';
import 'package:flutter/material.dart';

class CalenderView extends StatelessWidget {
  const CalenderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        // Adding the CalenderViewAppBar and CalenderViewBody widgets to the column
        children: [
          CalenderViewAppBar(),
          Expanded(child: CalenderViewBody()),
        ],
      ),
    );
  }
}
