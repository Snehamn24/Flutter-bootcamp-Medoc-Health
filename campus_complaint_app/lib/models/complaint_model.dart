// Complaint Model Class
// Used to represent a complaint object

class Complaint {

  // Complaint title
  final String title;

  // Complaint category
  final String category;

  // Complaint description
  final String description;

  // Complaint location
  final String location;

  // Current complaint status
  final String status;

  // Constructor
  // Used when creating a Complaint object
  Complaint({

    required this.title,

    required this.category,

    required this.description,

    required this.location,

    required this.status,
  });

  // Convert Complaint object into Map
  // Useful when storing data in Firebase
  Map<String, dynamic> toMap() {

    return {

      "title": title,

      "category": category,

      "description": description,

      "location": location,

      "status": status,
    };
  }

  // Convert Map into Complaint object
  // Useful when reading data from Firebase
  factory Complaint.fromMap(
      Map<String, dynamic> map) {

    return Complaint(

      title: map["title"] ?? "",

      category: map["category"] ?? "",

      description: map["description"] ?? "",

      location: map["location"] ?? "",

      status: map["status"] ?? "",
    );
  }
}