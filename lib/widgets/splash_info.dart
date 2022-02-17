import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashInfo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[200],
      child: Container(
        width: 250,
        height: 340,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Align(
                    alignment: Alignment.centerRight,
                    child:Icon(Icons.close, size:25,)
                ),
              ),
              Text('Правила', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text('1. Есть пять уровней интуиции: сильная (от 40 до 50 балов), хорошая (от 30 до 40 балов), нормальная (от 20 до 30 балов), слабая (меньше 20 балов).', style: TextStyle(fontSize: 17,), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text('2. Для определения уровня нужной сыграть 5 раундов.', style: TextStyle(fontSize: 17,), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text('3. Максимальное количество балов за 1 раунд 10.', style: TextStyle(fontSize: 17,), textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: 80,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  child: Center(child:Text('OK'),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}