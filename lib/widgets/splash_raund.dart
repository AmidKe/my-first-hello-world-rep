import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashRaund extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[200],
      child: Container(
        width: 250,
        height: 180,
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
              Text('Игра началась', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text('Угадай какую фигуру выбрал компьютер.', style: TextStyle(fontSize: 17,), textAlign: TextAlign.center,),
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