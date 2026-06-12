// Import Flutter Material widgets
import 'package:flutter/material.dart';

// StatefulWidget is used because
// the selected category changes dynamically
class AddComplaintScreen extends StatefulWidget {
  const AddComplaintScreen({super.key});

  @override
  State<AddComplaintScreen> createState() =>
      _AddComplaintScreenState();
}

class _AddComplaintScreenState
    extends State<AddComplaintScreen> {

  // Global key used to identify and validate the form
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>();

  // Controller to read complaint title
  final TextEditingController titleController =
      TextEditingController();

  // Controller to read complaint description
  final TextEditingController descriptionController =
      TextEditingController();

  // Controller to read complaint location
  final TextEditingController locationController =
      TextEditingController();

  // Default selected category
  String selectedCategory = "Wi-Fi Issue";

  // Categories displayed in dropdown
  List<String> categories = [
    "Wi-Fi Issue",
    "Water Problem",
    "Electricity Problem",
    "Classroom Issue",
    "Hostel Issue",
    "Cleanliness Issue",
    "Other"
  ];

  // Function executed when Submit button is pressed
  void submitComplaint() {

    // Validate all form fields
    if (formKey.currentState!.validate()) {

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Complaint submitted successfully",
          ),
        ),
      );

      // Clear title field
      titleController.clear();

      // Clear description field
      descriptionController.clear();

      // Clear location field
      locationController.clear();

      // Reset dropdown value
      setState(() {
        selectedCategory = "Wi-Fi Issue";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      // Top bar
      appBar: AppBar(
        title: const Text("Add Complaint"),
      ),

      // Makes screen scrollable when keyboard opens
      body: SingleChildScrollView(

        // Padding around form
        padding: const EdgeInsets.all(20),

        // Form widget groups all input fields
        child: Form(

          // Connect form with GlobalKey
          key: formKey,

          child: Column(
            children: [

              // Complaint Title Field
              TextFormField(

                // Attach controller
                controller: titleController,

                decoration: const InputDecoration(

                  // Label shown inside field
                  labelText: "Complaint Title",

                  // Border design
                  border: OutlineInputBorder(),

                  // Icon shown on left
                  prefixIcon: Icon(Icons.title),
                ),

                // Validation function
                validator: (value) {

                  // Check empty field
                  if (value == null ||
                      value.isEmpty) {

                    return "Please enter complaint title";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Category Dropdown
              DropdownButtonFormField<String>(

                // Current selected value
               initialValue: selectedCategory,

                decoration: const InputDecoration(
                  labelText: "Category",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.category),
                ),

                // Create dropdown items dynamically
                items: categories.map((category) {

                  return DropdownMenuItem(

                    value: category,

                    child: Text(category),
                  );

                }).toList(),

                // Executes when category changes
                onChanged: (value) {

                  setState(() {

                    selectedCategory = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              // Complaint Description
              TextFormField(

                controller: descriptionController,

                // Multi-line textbox
                maxLines: 4,

                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                  prefixIcon:
                      Icon(Icons.description),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {

                    return "Please enter description";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              // Location Field
              TextFormField(

                controller: locationController,

                decoration: const InputDecoration(

                  labelText: "Location",

                  hintText:
                      "Example: Hostel Block A",

                  border: OutlineInputBorder(),

                  prefixIcon:
                      Icon(Icons.location_on),
                ),

                validator: (value) {

                  if (value == null ||
                      value.isEmpty) {

                    return "Please enter location";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              // Full-width button
              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  // Call submit function
                  onPressed: submitComplaint,

                  child: const Text(
                    "Submit Complaint",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}