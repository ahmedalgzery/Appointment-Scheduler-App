import 'package:appointment/core/utils/functions/select_time.dart';
import 'package:appointment/core/utils/utils.dart';
import 'package:appointment/core/widgets/custom_button.dart';
import 'package:appointment/core/widgets/custom_text_form_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddAppointmentForm extends StatefulWidget {
  const AddAppointmentForm({
    super.key,
  });

  @override
  State<AddAppointmentForm> createState() => _AddAppointmentFormState();
}

class _AddAppointmentFormState extends State<AddAppointmentForm> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  final fireStore = FirebaseFirestore.instance.collection('Appointment');
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? startTime, endTime, subject;
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
              subject = value;
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
              startTime = value;
            },
            onTap: () async {
              // Call the selectTime function to choose the start time
              selectTime(context: context, controller: startTimeController);
              startTime = startTimeController.text;
            },
            controller: startTimeController,
          ),
          CustomTextField(
            hintText: 'End Time',
            maxLines: 1,
            onSaved: (value) {
              endTime = value;
            },
            onTap: () {
              // Call the selectTime function to choose the end time
              selectTime(context: context, controller: endTimeController);
              endTime = endTimeController.text;
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
                String id = DateTime.now().microsecondsSinceEpoch.toString();
                fireStore.doc(id).set({
                  'id': id,
                  'Subject': subject,
                  'StartTime': startTime,
                  'EndTime': endTime,
                }).then((value) {
                  Utils().tostMessage(message: 'Appointment added');
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  setState(() {
                    loading = false;
                  });
                  Utils().tostMessage(message: error.toString());
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
