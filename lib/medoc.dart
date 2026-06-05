import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_flutter_app/flutter.dart';

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
        child : ElevatedButton(onPressed: () {
          Navigator.pushNamed(context,'second');
        }, child: Text('Press Me')),

      ),
      bottomNavigationBar: GNav(
          color: Colors.pink,
          tabs: [
        GButton(icon: Icons.add,
        onPressed:(){
          Navigator.pushNamed(context,'second');
        },),
        GButton(icon: Icons.local_activity,),
        GButton(icon: Icons.wallet),
      ]) ,

      );
  }
}