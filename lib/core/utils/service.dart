// This class provides methods to interact with Firestore for adding and fetching appointment data.
// It uses the 'Appointment' collection in Firestore to store appointment details.
import 'package:appointment/core/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final fireStore = FirebaseFirestore.instance.collection('Appointment');

  // Adds an appointment to Firestore with the given subject, start time, and end time.
  // Generates a unique ID for each appointment and displays a toast message for success or error.
  void addToFirebase({required subject, required startTime, required endTime}) {
    String id = DateTime.now().microsecondsSinceEpoch.toString();

    fireStore.doc(id).set({
      'id': id,
      'Subject': subject,
      'StartTime': startTime,
      'EndTime': endTime,
    }).then((value) {
      Utils().showToast(message: 'Appointment added');
    }).catchError((error, stackTrace) {
      Utils().showToast(message: error.toString());
    });
  }

  // Fetches the appointment data from Firestore and returns a list of appointment maps.
  // Queries the 'Appointment' collection, iterates through the documents, and adds the data to the list.
  Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
    List<Map<String, dynamic>> dataList = [];

    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Appointment').get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      dataList.add(data);
    }

    return dataList;
  }
}
