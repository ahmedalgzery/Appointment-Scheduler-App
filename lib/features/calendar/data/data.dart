import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> fetchDataFromFirestore() async {
  List<Map<String, dynamic>> dataList = [];

  // Query the 'Appointment' collection in Firestore
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Appointment').get();

  // Iterate through the documents in the query snapshot
  for (var doc in querySnapshot.docs) {
    // Extract the document data as a map
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    // Add the data map to the list
    dataList.add(data);
  }

  // Return the list of data
  return dataList;
}
