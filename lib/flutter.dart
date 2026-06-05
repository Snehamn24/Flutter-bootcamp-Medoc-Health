import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, 'buffer');
          },
          child: Text('Second  Screen'),
        ),
      ),
    );
  }
}