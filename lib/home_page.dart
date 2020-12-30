import 'package:flutter/material.dart';
import 'package:chate/chatScreen.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
   appBar:new  AppBar(
     title:new  Center(child:Text('Chat Application'),),
   ),
      body: new ChatScreen(),


    );
  }
}
