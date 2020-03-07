
import 'dart:io';

import 'package:canteen_management/add_order.dart';
import 'package:canteen_management/canteen_details.dart';
import 'package:canteen_management/online_order.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
     final List<Widget> _children = [
       new AddOrder(),
       new OnlineOrder(),
       new CanteenDetails()];
     void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
   }
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: _currentIndex, // this will be set when a new tab is tapped
       onTap: onTabTapped,
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.add_circle),
           title: new Text('Add order'),
           
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.fastfood),
           title: new Text('Online Order'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           title: Text('Profile')
         )
       ],
     ),

      
    ),
    );
  }
  
}