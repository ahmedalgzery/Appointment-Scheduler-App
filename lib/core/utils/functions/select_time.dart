  // ignore_for_file: use_build_context_synchronously

  import 'package:flutter/material.dart';

Future<void> selectTime({required BuildContext context,required TextEditingController controller }) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Format the picked time as per your requirement
      String formattedTime = pickedTime.format(context);
      controller.text = formattedTime ;
    }
  }
