import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:extragame/widgets/splash_info.dart';
import 'package:extragame/widgets/round_stars.dart';
import 'package:extragame/widgets/diagramma.dart';


class CustomInfoBar extends StatefulWidget{
  final String userLevel;
  final String roundNumber;
  final int userPoint;
  final int igrokWins;

  CustomInfoBar({
    required this.userLevel,
    required this.roundNumber,
    required this.userPoint,
    required this.igrokWins,
  });

  @override
  _CustomBarState createState() => _CustomBarState();
}

class _CustomBarState extends State<CustomInfoBar>{

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: double.infinity,
        height: 180.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 1.5,
              offset: Offset(-3,-3),
            ),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.5,
              offset: Offset(3,3),
            ),
          ],
        ),
        child:
        Column(
            children: [
              SizedBox(height: 15.0,),
              Text('Ваша интуиция: ${widget.userLevel}',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              //Color(0xFF00e15c),
              SizedBox(height: 15.0,),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    StarRound(roundCounter: int.parse(widget.roundNumber), userPoints: widget.userPoint,),
                    BarDiagrama(userWins: widget.igrokWins,),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0),
                child:
                  GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => SplashInfo(),
                  );
                },
                child:
                Container(
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(width: 0.5, color: Colors.black26),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Правила', style: TextStyle(fontSize: 17),),
                      SizedBox(width: 7.0,),
                      Icon(Icons.help, size: 20.0, color: Colors.black38),
                    ],
                  ),
                ),
              ),
              ),
            ]
        ),
      );
  }

}


