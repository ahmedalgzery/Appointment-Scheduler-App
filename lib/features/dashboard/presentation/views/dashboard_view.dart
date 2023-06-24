import 'package:appointment/features/dashboard/presentation/views/widgets/dashboard_view_body.dart';
import 'package:flutter/material.dart';

import 'widgets/dashboard_app_bar_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        
        body: Column(
          // Adding the DashboardViewAppBar and DashboardViewBody widgets to the column
          children: [DashboardViewAppBar(), DashboardViewBody()],
        ),
      ),
    );
  }
}
