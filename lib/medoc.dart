import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:Icon(Icons.add),
          title : Text("Routes"),
        centerTitle:true,
      ),
      body:Container(
        child : ElevatedButton(onPressed: () {}, child: Text('Press Me')),

      )

      );
  }
}