import 'package:appointment/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/dashboard_app_bar_view.dart';

// This widget represents the dashboard view of the application.
// It displays a custom app bar and the body content using DashboardViewAppBar and DashboardViewBody widgets.

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Displaying the custom app bar
            DashboardViewAppBar(),
            // Displaying the body content
            DashboardViewBody(),
          ],
        ),
      ),
    );
  }
}
