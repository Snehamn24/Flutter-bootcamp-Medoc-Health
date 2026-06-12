// Import Flutter Material Design package
import 'package:flutter/material.dart';

//import the complaint card
import '../widgets/complaint_card.dart';
// ComplaintHistoryScreen is a StatelessWidget
// because currently the complaint data is fixed
// and does not change dynamically.
class ComplaintHistoryScreen extends StatelessWidget {

  // Constructor
  const ComplaintHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Temporary complaint data
    // Later this data will come from Firebase Firestore
    List<Map<String, String>> complaints = [

      {
        "title": "Wi-Fi Not Working",
        "status": "Pending",
        "location": "Hostel Block A"
      },

      {
        "title": "Water Leakage",
        "status": "Resolved",
        "location": "Classroom 204"
      },

      {
        "title": "Fan Not Working",
        "status": "In Progress",
        "location": "Lab 3"
      },
    ];

    return Scaffold(

      // Top App Bar
      appBar: AppBar(
        title: const Text(
          "Complaint History",
        ),
      ),

      // ListView.builder creates list items dynamically
      body: ListView.builder(

        // Total number of complaints
        itemCount: complaints.length,

        // Builds each complaint card one by one
        itemBuilder: (context, index) {
         return ComplaintCard(
  title: complaints[index]["title"]!,
  status: complaints[index]["status"]!,
  location: complaints[index]["location"]!,
         );
        },
         ),
      );
        }
}