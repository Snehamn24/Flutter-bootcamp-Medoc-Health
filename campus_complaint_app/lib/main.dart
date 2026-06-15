import 'package:flutter/material.dart';//material design library
import 'screens/login_screen.dart';//import the login screen file

void main() {
  runApp(const CampusComplaintApp()); //root widget
}

class CampusComplaintApp extends StatelessWidget { //stl widget means the state of the widget does not change by itself
  const CampusComplaintApp({super.key}); //this is the constructor->it helps to implement the CampusComplaintapp widget

  @override
  Widget build(BuildContext context) { //tells the flutter where this widget is places in the app tree
    return MaterialApp(
      title: 'Campus Complaint App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const LoginScreen(), //comes from the login_screen this tells that the first page should be login page only
    );
  }
}

// In main.dart, the app execution starts from the 
// main function. runApp loads the root widget. 
// we have a  StatelessWidget
// CampusComplaintApp. Inside MaterialApp,there is  
// the app title, theme, removed debug 
// banner, and opened LoginScreen as the first screen