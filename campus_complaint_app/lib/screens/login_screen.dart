// Import Flutter Material Design widgets
import 'package:flutter/material.dart';

// Import StudentHomeScreen so we can navigate to it after login
import 'student_home_screen.dart';

// LoginScreen is a StatefulWidget because
// email and password values can change while typing
class LoginScreen extends StatefulWidget {

  // Constructor
  const LoginScreen({super.key});

  // Creates the mutable state object
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

// State class for LoginScreen
class _LoginScreenState extends State<LoginScreen> {

  // Controller used to read email entered by the user
  final TextEditingController emailController =
      TextEditingController();

  // Controller used to read password entered by the user
  final TextEditingController passwordController =
      TextEditingController();

  // Function called when Login button is pressed
  void loginUser() {

    // Read email text and remove extra spaces
    String email = emailController.text.trim();

    // Read password text and remove extra spaces
    String password = passwordController.text.trim();

    // Check if either field is empty
    if (email.isEmpty || password.isEmpty) {

      // Show a SnackBar message at the bottom
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter email and password',
          ),
        ),
      );

      // Stop further execution
      return;
    }

    // If validation succeeds,
    // navigate to StudentHomeScreen
    Navigator.pushReplacement(

      // Current screen context
      context,

      // Route to next screen
      MaterialPageRoute(

        // Screen to open
        builder: (context) =>
            const StudentHomeScreen(),
      ),
    );
  }

  // UI starts here
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Main body of screen
      body: Padding(

        // Give spacing around the screen
        padding: const EdgeInsets.all(20),

        child: Center(

          child: SingleChildScrollView(

            // Makes screen scrollable
            // when keyboard appears

            child: Column(

              children: [

                // App logo icon
                const Icon(
                  Icons.report_problem,
                  size: 90,
                  color: Colors.indigo,
                ),

                const SizedBox(height: 20),

                // App title
                const Text(
                  'Campus Complaint App',

                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                // Email input field
                TextField(

                  // Attach email controller
                  controller: emailController,

                  decoration: const InputDecoration(

                    // Label shown inside field
                    labelText: 'Email',

                    // Border style
                    border: OutlineInputBorder(),

                    // Icon at beginning
                    prefixIcon: Icon(Icons.email),
                  ),
                ),

                const SizedBox(height: 15),

                // Password input field
                TextField(

                  // Attach password controller
                  controller: passwordController,

                  // Hide password characters
                  obscureText: true,

                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),

                const SizedBox(height: 20),

                // Makes button take full width
                SizedBox(
                  width: double.infinity,

                  child: ElevatedButton(

                    // Function called when pressed
                    onPressed: loginUser,

                    child: const Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}