import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Function to show a time picker dialog and handle the selected time
Future<void> selectTime({
  required BuildContext context,
  required TextEditingController controller,
}) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (pickedTime != null) {
    // Create a DateTime object with the selected time and the current date
    DateTime now = DateTime.now();
    DateTime selectedDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      pickedTime.hour,
      pickedTime.minute,
      0,
    );

    // Format the selected time as "hh:mm:ss"
    String formattedTime = DateFormat('HH:mm:ss').format(selectedDateTime);

    // Set the formatted time to the provided text controller
    controller.text = formattedTime;
  }
}
