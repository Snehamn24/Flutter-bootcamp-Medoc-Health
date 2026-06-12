// Import Flutter Material widgets
import 'package:flutter/material.dart';

// Custom reusable widget
class ComplaintCard extends StatelessWidget {

  // Complaint title
  final String title;

  // Complaint status
  final String status;

  // Complaint location
  final String location;

  // Constructor
  const ComplaintCard({
    super.key,

    required this.title,
    required this.status,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {

    return Card(

      // Space around card
      margin: const EdgeInsets.all(10),

      child: ListTile(

        // Left-side warning icon
        leading: const Icon(
          Icons.report_problem,
          color: Colors.indigo,
        ),

        // Complaint title
        title: Text(title),

        // Complaint details
        subtitle: Text(
          "Location: $location\n"
          "Status: $status",
        ),

        // Right-side arrow
        trailing: const Icon(
          Icons.arrow_forward_ios,
        ),
      ),
    );
  }
}