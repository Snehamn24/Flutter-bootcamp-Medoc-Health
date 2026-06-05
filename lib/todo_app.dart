import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home : TodoPage(),  
    );
  }
}

//stateful widgets task list changes
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  //Text controller for TextField
 final TextEditingController taskController = TextEditingController();

 //List of tasks
List<Map<String,dynamic>> tasks = [
  {"title":"Learn flutter","done":false},
  {"title":"Practice Dart","done":false},
];

//
// Function to show dialog box
void openAddTaskDialog() {
showDialog(
context: context,
builder: (context) {
return AlertDialog(
title: const Text("Add New Task"),

// TextField inside dialog
content: TextField(
controller: taskController,
decoration: const InputDecoration(
hintText: "Enter task name",
border: OutlineInputBorder(),
),
),

actions: [
// Cancel button
TextButton(
onPressed: () {
taskController.clear();
Navigator.pop(context);
},
child: const Text("Cancel"),
),

// Add button
ElevatedButton(
onPressed: () {
if (taskController.text.isNotEmpty) {
setState(() {
tasks.add({
"title": taskController.text,
"done": false,
});
});

taskController.clear();
Navigator.pop(context);
}
},
  child: const Text("Add"),
),
],
);
},
);
}
  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top app bar
      appBar: AppBar(
        title: const Text("To-Do App"),
        centerTitle: true,
      ),

      // ListView shows all tasks
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              // Checkbox for completed/not completed
              leading: Checkbox(
                value: tasks[index]["done"],
                onChanged: (value) {
                  setState(() {
                    tasks[index]["done"] = value!;
                  });
                },
              ),

              // Task title
              title: Text(
                tasks[index]["title"],
                style: TextStyle(
                  fontSize: 18,

                  // If task is done, show line through text
                  decoration: tasks[index]["done"]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),

              // Delete button
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),

      // Floating button to open dialog
      floatingActionButton: FloatingActionButton(
        onPressed: openAddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}