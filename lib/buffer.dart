import 'package:flutter/material.dart';
class MyBuffer extends StatelessWidget {
  const MyBuffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Buffer"),
      ),
      body: Container(
        height : 100,
        width : 500,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(Icons.add
              ),
              Text("I need to go to home"),
            ],
          ),
        ),
      ),
    );
  }
}
