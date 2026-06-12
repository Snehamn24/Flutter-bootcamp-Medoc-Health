import 'package:flutter/material.dart';

//main starting point of the code
//main () is the starting point of any flutter program
//runApp will tell to run this widget as a MyApp
//MyApp is the first widget
void main() {
  runApp(const MyApp());
}

//MyApp is a stateless Widget because it does not change
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //MaterialApp gives your app a material  design
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home : TodoPage(),  
    );
  }
}

//the UI will rebuilt once the new task has been added /deleted / checked
//stateful widgets task list changes
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

//state class
class _TodoPageState extends State<TodoPage> {
  //Text controller for TextField
  //TextField helps us to fetch the text typed from the user
 final TextEditingController taskController = TextEditingController();

 //List of tasks
 //stored as map
List<Map<String,dynamic>> tasks = [
  {"title":"Learn flutter","done":false},
  {"title":"Practice Dart","done":false},
];


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
    //   To add a checkbox in Flutter, you use the standard Checkbox widget or the CheckboxListTile widget if you need an accompanying text label. Because the checkbox itself is stateless, you must place it inside
    // a StatefulWidget to track and update its checked
    // or unchecked value
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