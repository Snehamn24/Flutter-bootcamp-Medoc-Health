import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const CampusComplaintApp());
}

class CampusComplaintApp extends StatelessWidget {
  const CampusComplaintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Complaint App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LoginScreen(),
    );
  }
}

// In main.dart, the app execution starts from the 
// main function. runApp loads the root widget. 
// we have a  StatelessWidget
// CampusComplaintApp. Inside MaterialApp,there is  
// the app title, theme, removed debug 
// banner, and opened LoginScreen as the first screen