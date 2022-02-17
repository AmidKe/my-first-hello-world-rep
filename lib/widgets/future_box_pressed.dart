import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassBoxPressed extends StatefulWidget {
  final String imageFig;
  GlassBoxPressed({Key? key, required this.imageFig,}) : super (key: key);

  @override
  _GlassBoxPressedState createState() => _GlassBoxPressedState();

}

class _GlassBoxPressedState extends State<GlassBoxPressed>{


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 4.0,
              offset: Offset(-2,-2),
            ),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4.0,
              offset: Offset(2,2),
            ),
          ]
      ),
      child: Center(
        child: Image(image: AssetImage(widget.imageFig), width:110.0, height: 110.0,),
      ),
    );
  }

}