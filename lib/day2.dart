import 'package:flutter/material.dart';
import 'package:my_flutter_app/buffer.dart';
import 'package:my_flutter_app/flutter.dart';
import 'package:my_flutter_app/medoc.dart';
void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: 'second',
      routes: {
      'home' : (context)=>HomePage(),
        'second' : (context)=>SecondScreen(),
        'buffer' : (context)=>MyBuffer(),

      },


    );
  }
}
