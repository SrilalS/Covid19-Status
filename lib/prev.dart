import 'package:flutter/material.dart';

class Prevscr extends StatefulWidget {
  Prevscr({Key key}) : super(key: key);

  @override
  _PrevscrState createState() => _PrevscrState();
}

class _PrevscrState extends State<Prevscr> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         appBar: AppBar(),
         body: SingleChildScrollView(
           child: Column(
             children: <Widget>[

               Container(
                 margin: EdgeInsets.all(8),
                 child: Card(

                 ),
               )

             ],
           ),
         ),
       ),
    );
  }
}