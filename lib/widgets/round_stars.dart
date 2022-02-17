import 'package:flutter/material.dart';

class StarRound extends StatelessWidget{
  final int roundCounter;
  final int userPoints;

  StarRound({required this.roundCounter, required this.userPoints});

  @override
  Widget build(BuildContext context){
    return Container(
      child: Column (
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child:Text('Раунд ${roundCounter} из 5', style: TextStyle(fontSize: 19),),
          ),
          Row(
            children: [
             (roundCounter >= 1) ? Icon(Icons.star, color: Colors.yellow,) : Icon(Icons.star, color: Colors.grey,),
             (roundCounter >= 2) ? Icon(Icons.star, color: Colors.yellow,) : Icon(Icons.star, color: Colors.grey,),
             (roundCounter >= 3) ? Icon(Icons.star, color: Colors.yellow,) : Icon(Icons.star, color: Colors.grey,),
             (roundCounter >= 4) ? Icon(Icons.star, color: Colors.yellow,) : Icon(Icons.star, color: Colors.grey,),
             (roundCounter== 5) ? Icon(Icons.star, color: Colors.yellow,) : Icon(Icons.star, color: Colors.grey,),
            ],
          ),
          SizedBox(height: 7,),
          Text('Мои ходы: ${userPoints}', style: TextStyle(fontSize: 19),),
        ],
      )
    );
  }
}