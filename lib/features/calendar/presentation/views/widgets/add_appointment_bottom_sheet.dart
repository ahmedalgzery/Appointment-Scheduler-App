import 'package:appointment/features/calendar/presentation/views/widgets/add_appointment_form.dart';
import 'package:flutter/material.dart';

class AddAppointmentBottomSheet extends StatelessWidget {
  const AddAppointmentBottomSheet({super.key});

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
        child: const SingleChildScrollView(
          child: AddAppointmentForm(),
        ),
      ),
    );
  }
}
