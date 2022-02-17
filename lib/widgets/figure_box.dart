import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassBox extends StatefulWidget {
  final String imageFig;
  GlassBox({Key? key, required this.imageFig,}) : super (key: key);

  @override
  _GlassBoxState createState() => _GlassBoxState();

}

class _GlassBoxState extends State<GlassBox>{


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
                offset: Offset(-5,-5),
              ),
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4.0,
                offset: Offset(5,5),
              ),
            ]
        ),
        child: Center(
          child: Image(image: AssetImage(widget.imageFig), width:110.0, height: 110.0,),
        ),
    );
  }

}