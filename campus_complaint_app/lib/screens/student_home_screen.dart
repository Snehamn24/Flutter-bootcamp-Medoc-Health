// Import Flutter Material widgets
import 'package:flutter/material.dart';

// Import Add Complaint screen
import 'add_complaint_screen.dart';

// Import Complaint History screen
import 'complaint_history_screen.dart';

// StatelessWidget because currently
// this screen only displays data
// and does not change dynamically
class StudentHomeScreen extends StatelessWidget {

  // Constructor
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Top bar of the application
      appBar: AppBar(

        // Title shown in AppBar
        title: const Text('Student Dashboard'),

        // Place title at center
        centerTitle: true,
      ),

      // Main content of screen
      body: Padding(

        // Add spacing around all widgets
        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            // Welcome text
            const Text(
              'Welcome Student',

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Vertical spacing
            const SizedBox(height: 30),

            // First Card
            Card(

              child: ListTile(

                // Left side icon
                leading: const Icon(
                  Icons.add_circle,
                  color: Colors.indigo,
                ),

                // Main title
                title: const Text(
                  'Raise New Complaint',
                ),

                // Subtitle below title
                subtitle: const Text(
                  'Report campus-related issues',
                ),

                // Right side arrow
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),

                // Action when user taps card
                onTap: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (context) =>
                          const AddComplaintScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // Second Card
            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.history,
                  color: Colors.indigo,
                ),

                title: const Text(
                  'Complaint History',
                ),

                subtitle: const Text(
                  'View submitted complaints',
                ),

                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),

                onTap: () {

                  Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (context) =>
                          const ComplaintHistoryScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}