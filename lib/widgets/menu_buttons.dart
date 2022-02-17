import 'dart:ui';

import 'package:flutter/material.dart';

class MenuButtons extends StatefulWidget {
  final String buttonText;

  MenuButtons({Key? key, required this.buttonText, })
      : super (key: key);

  @override
  _MenuButtonsState createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons>{

  @override
  Widget build(BuildContext context) {
    return
        Container(
            width: 75.0,
            height: 35.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 4.0,
                  offset: Offset(-5,-5),
                ),
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4.0,
                  offset: Offset(5,5),
                ),
              ],
            ),
            child: Center(child:Text(widget.buttonText, style: TextStyle(fontWeight: FontWeight.bold),)),
      );
  }

}