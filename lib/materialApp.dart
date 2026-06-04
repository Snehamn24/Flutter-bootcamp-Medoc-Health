//importing the material pack
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:MyApp(),
    ),);

}
//type stl to find the stateless widgets

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    //for the pages the widger is Scaffold - container to hold other widgets
    return Scaffold(
      appBar: AppBar(
        title: Text("My first App"),
        backgroundColor: Colors.green[100],
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$count"),
            Text("Hey I am learning flutter"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
         count++;
        });
      },
        child: Icon(Icons.add,),
      ),

    );
  }
}