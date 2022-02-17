import 'dart:ui';

import 'package:flutter/material.dart';

class LevelCard extends StatelessWidget{

  final String cardTitle;
  final int levelIndex;

  LevelCard({Key? key, required this.cardTitle, required this.levelIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 5,
              offset: Offset(-5,-5),
            ),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              offset: Offset(5,5),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text (this.cardTitle, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            SizedBox(width: 5,),
            Icon(Icons.lock, color: Colors.black,),
            SizedBox(width: 5,),
            (this.levelIndex >= 2) ? Icon(Icons.lock, color: Colors.black,) : Icon(Icons.lock_outline, color: Colors.black,),
            SizedBox(width: 5,),
            (this.levelIndex == 3) ? Icon(Icons.lock, color: Colors.black,) : Icon(Icons.lock_outline, color: Colors.black,),
            ],
          ),
        ),
    );
  }
}