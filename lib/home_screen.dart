
import 'dart:io';

import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<bool> _onBackPressed()  {
   return showDialog(
    context: context,
     builder :(context)=> AlertDialog(
        title: Text('Do You want To Exit App?'),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=>exit(0), 
            child: Text('Yes')),
          FlatButton(
            onPressed: ()=>Navigator.pop(context,false), 
            child: Text('No'))
        ],  
     ), 
   );
}
  @override
  
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child:  new Scaffold(
     
      appBar: AppBar(title: Text('My Canteen'),),
      
    ),
    );
  }
  
}