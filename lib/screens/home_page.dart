import 'dart:ui';

import 'package:extragame/widgets/splash_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extragame/widgets/home_page_level_card.dart';
import 'package:extragame/screens/level_three.dart';
import 'package:extragame/screens/level_two.dart';
import 'package:extragame/screens/level_one.dart';

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Text('ИНТУИЦИЯ', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 40.0,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LevelOneGame()),);
                },
                child: LevelCard(cardTitle: 'Раунд 1 ', levelIndex: 1,),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LevelTwoGame()),);
                },
                child: LevelCard(cardTitle: 'Раунд 2 ', levelIndex: 2,),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()),);
                },
                child: LevelCard(cardTitle: 'Раунд 3 ', levelIndex: 3,),
              ),
              SizedBox(height: 35.0,),
              GestureDetector(
                onTap: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => SplashInfo(),
                  );
                },
                child:
                Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(width: 0.5, color: Colors.black26),
                  ),
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Правила', style: TextStyle(fontSize: 20),),
                      SizedBox(width: 7.0,),
                      Icon(Icons.help, size: 21.0, color: Colors.black38,),
                    ],
                  ),
                ),
              ),
            ],
          ),

      ),
    );
  }
}
