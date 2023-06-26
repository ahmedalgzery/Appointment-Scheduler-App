import 'dart:math';

import 'package:appointment/features/dashboard/data/data.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';

// This widget represents the body content of the dashboard view.
// It displays a pie chart using DChartPie from the d_chart package.

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final random = Random();

    // Function to generate a random color
    Color getRandomColor() {
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
    }

    final chartHeight = MediaQuery.of(context).size.height * 0.8;
    final chartWidth = MediaQuery.of(context).size.width * 0.8;

    return SizedBox(
      height: chartHeight,
      width: chartWidth,
      child: DChartPie(
        // Providing the data for the pie chart
        data: pieCartData,

        // Setting the label position to inside the pie
        labelPosition: PieLabelPosition.inside,

        // Showing label lines
        showLabelLine: true,

        // Setting a random fill color for each pie segment
        fillColor: (pieData, index) => getRandomColor(),

        // Setting the width of the donut chart
        donutWidth: 50,

        // Setting the label color to white
        labelColor: Colors.white,

        // Enabling animation
        animate: true,

        // Setting the animation duration
        animationDuration: const Duration(seconds: 2),
      ),
    );
  }
}
