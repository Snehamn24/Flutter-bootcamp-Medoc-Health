//importing the material pack
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home:MyApp(),
    ),);

}
//type stl to find the stateless widgets
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //for the pages the widger is Scaffold - container to hold other widgets
    return Scaffold(
      appBar: AppBar(
        title: Text("My first App"),
      ),

    );
  }
}