import 'package:appointment/core/utils/functions/select_time.dart';
import 'package:appointment/core/utils/service.dart';
import 'package:appointment/core/widgets/custom_button.dart';
import 'package:appointment/core/widgets/custom_text_form_field.dart';
import 'package:appointment/features/calendar/data/data.dart';
import 'package:flutter/material.dart';

// This widget represents the form for adding an appointment.
// It includes text fields for the subject, start time, and end time.
// The user can select the start and end times using the selectTime function.
// When the user taps the "Save" button, the appointment data is saved to Firebase and the form is dismissed.

class AddAppointmentForm extends StatefulWidget {
  const AddAppointmentForm({
    super.key,
    required this.date,
  });
  final CalenderData date;
  @override
  State<AddAppointmentForm> createState() => _AddAppointmentFormState();
}

class _AddAppointmentFormState extends State<AddAppointmentForm> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String subject, startTime, endTime;
  bool loading = false;
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalKey,
      child: Column(
        children: [
          const SizedBox(
            height: 15.0,
          ),
          CustomTextField(
            maxLines: 4,
            hintText: 'Subject',
            onSaved: (value) {
              subject = value!;
            },
            onTap: () {},
            controller: subjectController,
          ),
          const SizedBox(
            height: 25.0,
          ),
          CustomTextField(
            hintText: 'Start Time',
            maxLines: 1,
            onSaved: (value) {
              startTime = value!;
            },
            onTap: () async {
              // Call the selectTime function to choose the start time
              selectTime(context: context, controller: startTimeController);
              startTime = startTimeController.text.toString();
            },
            controller: startTimeController,
          ),
          CustomTextField(
            hintText: 'End Time',
            maxLines: 1,
            onSaved: (value) {
              endTime = value!;
            },
            onTap: () {
              // Call the selectTime function to choose the end time
              selectTime(context: context, controller: endTimeController);
              endTime = endTimeController.text.toString();
            },
            controller: endTimeController,
          ),
          const SizedBox(
            height: 25.0,
          ),
          CustomButton(
            loading: loading,
            onTap: () {
              if (globalKey.currentState!.validate()) {
                globalKey.currentState!.save();
                setState(() {
                  loading = true;
                });

                FirebaseService().addToFirebase(
                    endTime: '${widget.date.endDate} $endTime',
                    startTime: '${widget.date.startDate} $startTime',
                    subject: subject);

                FirebaseService().fetchDataFromFirestore();
                Navigator.pop(context);
                setState(() {
                  loading = false;
                });
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(
            height: 25.0,
          ),
        ],
      ),
    );
  }
}
