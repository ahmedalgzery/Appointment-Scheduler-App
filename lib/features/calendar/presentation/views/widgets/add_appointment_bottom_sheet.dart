import 'package:appointment/features/calendar/data/data.dart';
import 'package:appointment/features/calendar/presentation/views/widgets/add_appointment_form.dart';
import 'package:flutter/material.dart';

// This widget represents the bottom sheet for adding an appointment.
// It includes the AddAppointmentForm widget that contains the form fields.
// The date parameter is passed to the AddAppointmentForm widget.

class AddAppointmentBottomSheet extends StatelessWidget {
  const AddAppointmentBottomSheet({super.key, required this.date});

  final CalenderData date;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      ignoringSemantics: true,
      absorbing: false,
      child: Padding(
        padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: AddAppointmentForm(date: date),
        ),
      ),
    );
  }
}
