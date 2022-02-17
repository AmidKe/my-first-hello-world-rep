import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarDiagrama extends StatelessWidget{
  final int userWins;
  BarDiagrama({required this.userWins});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                height: 15,
                width: 40,
                decoration: BoxDecoration(
                  color: (userWins==4) ? Colors.greenAccent : Colors.black12,
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              SizedBox(height: 1.5,),
              Container(
                height: 15,
                width: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: (userWins>=3) ?
                    [
                      Colors.yellowAccent,
                      Colors.greenAccent,
                    ]:
                    [
                      Colors.black12,
                      Colors.black12,
                    ],
                  ),
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              SizedBox(height: 1.5,),
              Container(
                height: 15,
                width: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: (userWins>=2) ?
                    [
                      Colors.orangeAccent,
                      Colors.yellowAccent,
                    ] : [
                      Colors.black12,
                      Colors.black12,
                    ],
                  ),
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
              SizedBox(height: 1.5,),
              Container(
                height: 15,
                width: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: (userWins>=1) ?
                    [
                      Colors.redAccent,
                      Colors.orangeAccent,
                    ]:
                    [
                      Colors.black12,
                      Colors.black12,
                    ],
                  ),
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0),
          Container(
            width: 90,
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Сильный', style: TextStyle(fontSize: 15),),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Хорошый', style: TextStyle(fontSize: 15),),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Нормальый', style: TextStyle(fontSize: 15),),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Слабый', style: TextStyle(fontSize: 15 ),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}