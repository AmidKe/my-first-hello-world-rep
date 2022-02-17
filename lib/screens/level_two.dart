import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:extragame/widgets/figure_box.dart';
import 'package:extragame/widgets/future_box_pressed.dart';
import 'package:extragame/widgets/menu_button_pressed.dart';
import 'package:extragame/widgets/menu_buttons.dart';
import 'package:extragame/widgets/info_bar.dart';
import 'package:extragame/screens/home_page.dart';
import 'package:extragame/widgets/splash_raund.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class LevelTwoGame extends StatefulWidget {
  const LevelTwoGame({Key? key}) : super (key: key);
  @override
  _LevelTwoState createState() => _LevelTwoState();
}

class _LevelTwoState extends State<LevelTwoGame>{

  List<String>
  _imgFigureAddr = ['img/Kvadr.png','img/Krug.png','img/Treug.png'],
      _imgFigureAddrRed = ['img/red/Kvadr-red.png','img/red/Krug-red.png','img/red/Treug-red.png'],
      _imgFigureAddrGreen = ['img/green/Kvadr-green.png','img/green/Krug-green.png','img/green/Treug-green.png'],
      _resultLevel = ['Слабый', 'Нормальный', 'Хороший', 'Сильный',];
  List<int> _listOfFigureNumbers = [1, 2, 3,];


  String
    _imgKvadrat = '',
    _imgKrug = '',
    _imgTreugolnik = '',
    _imageFigura = '',
    _userLevel =' - ';

  int _hodByPlayer = 0,
      _hodComputara = 0,
      _promahCounter = 0,
      _resultUser = 0,
      _roundNumber = 0,
      _igrokLevel = 0,
      _igrokHod = 0,
      _userWinCounter = 0,
      _playerResultCounter = 0;

  bool _buttonStartClick = false,
      _kvadratClick = false,
      _krugClick = false,
      _treugClick = false;

  void setAddrToFigure (){
    _imgKvadrat = _imgFigureAddr[0];
    _imgKrug = _imgFigureAddr[1];
    _imgTreugolnik = _imgFigureAddr[2];
  }

  void startGame() {
    setState(() {
      _roundNumber++;
      if (_roundNumber>5){
        endGame();
      } else {

      }
      _igrokHod = 0;
      _igrokLevel = 0;
      startPlayWithComputer ();
      _userWinCounter = 0;
    });

  }

  void startPlayWithComputer (){
    int _rundomnoeChislo;
    _kvadratClick = false;
    _krugClick = false;
    _treugClick = false;
    var _hodComputaraRandom = new Random();
    _rundomnoeChislo = _hodComputaraRandom.nextInt(3);
    switch (_rundomnoeChislo){
      case 0 :
        _hodComputara = _listOfFigureNumbers[0];
        break;
      case 1 :
        _hodComputara = _listOfFigureNumbers[1];
        break;
      case 2 :
        _hodComputara = _listOfFigureNumbers[2];
        break;
    }
  }


  void sentButtonPressParameter (int _buttonFiguraNumber) {
    _hodByPlayer = _buttonFiguraNumber;
    if (_buttonStartClick) {
      if (checkPlayerHod()) {
        _imageFigura = _imgFigureAddrGreen[_buttonFiguraNumber - 1];
        viborFiguriHodIgroka (_hodByPlayer);
        startTimer();
        getResultOchkiUser();
      } else {
        _imageFigura = _imgFigureAddrRed[_buttonFiguraNumber - 1];
        viborFiguriHodIgroka (_hodByPlayer);
        _promahCounter++;
      }
    }
    checkPromahCounter();
    checkUserLevel();
  }

  void checkPromahCounter() {
    if (_promahCounter==2){
      _igrokHod++;
      _playerResultCounter++;
      startTimer();
      showWinner();
    }
  }

  bool checkPlayerHod () {
    bool _ugadal;
    if (_hodComputara == _hodByPlayer) {
      _ugadal = true;
      _igrokHod++;
      _playerResultCounter++;
    } else {
      _ugadal = false;
    }
    return _ugadal;
  }

  void viborFiguriHodIgroka (_hodByPlayer){
    switch (_hodByPlayer) {
      case 1:
        _imgKvadrat = _imageFigura;
        break;
      case 2:
        _imgKrug = _imageFigura;
        break;
      case 3:
        _imgTreugolnik = _imageFigura;
        break;
    }
  }


  void getResultOchkiUser (){
    switch (_promahCounter){
      case 0:
        _resultUser =_resultUser + 4;
        _userWinCounter =_userWinCounter + 2;
        break;
      case 1:
        _resultUser =_resultUser + 2;
        _userWinCounter++;
        break;
    }
    showWinner();
  }

  void startTimer (){
    Timer.periodic(Duration(seconds: 1),(timer){
      setState(() {
        setAddrToFigure ();
      });
      timer.cancel();
      startPlayWithComputer ();
    });
  }

  void showWinner(){
    if (_resultUser >= 20) {
      startTimerWinnerPause();
      nullForShowWinner ();
      checkHod();
      startGame();
    }
    _promahCounter = 0;
    _kvadratClick = true;
    _krugClick = true;
    _treugClick = true;
  }

  void startTimerWinnerPause() {
    Timer.periodic(
        Duration(seconds: 4),
            (timer) {
          setState(() {
          });
          timer.cancel();
        }
    );
  }


  void nullForShowWinner (){
      _resultUser = 0;
      _promahCounter = 0;
      setAddrToFigure();
  }

  void endGame(){
    _resultUser = 0;
    _promahCounter = 0;
    _roundNumber = 0;
    _buttonStartClick = false;
    setAddrToFigure ();
    _hodComputara = 0;
    _hodByPlayer = 0;
    _kvadratClick = false;
    _krugClick = false;
    _treugClick = false;
    _playerResultCounter = 0;
    _igrokHod = 0;
    _igrokLevel = 0;
  }

  String checkHod(){
    switch (_roundNumber){
      case 1:
        if (_playerResultCounter <= 7 ) {
          _userLevel = _resultLevel[3];
        } else if ((_playerResultCounter >= 8)&(_playerResultCounter <= 10))  {
          _userLevel = _resultLevel[2];
        } else if ((_playerResultCounter >= 11)&(_playerResultCounter <= 13)) {
          _userLevel = _resultLevel[1];
        } else if (_playerResultCounter >= 14) {
          _userLevel = _resultLevel[0];
        }
        break;
      case 2:
        if (_playerResultCounter <= 14) {
          _userLevel = _resultLevel[3];
        } else if ((_playerResultCounter >= 15)&(_playerResultCounter <= 20))  {
          _userLevel = _resultLevel[2];
        } else if ((_playerResultCounter >= 21)&(_playerResultCounter <= 26)) {
          _userLevel = _resultLevel[1];
        } else if (_playerResultCounter >= 27) {
          _userLevel = _resultLevel[0];
        }
        break;
      case 3:
        if (_playerResultCounter <= 21) {
          _userLevel = _resultLevel[3];
        } else if ((_playerResultCounter >= 22)&(_playerResultCounter <= 30))  {
          _userLevel = _resultLevel[2];
        } else if ((_playerResultCounter >= 31)&(_playerResultCounter <= 39)) {
          _userLevel = _resultLevel[1];
        } else if (_playerResultCounter >= 40) {
          _userLevel = _resultLevel[0];
        }
        break;
      case 4:
        if (_playerResultCounter <= 28) {
          _userLevel = _resultLevel[3];
        } else if ((_playerResultCounter >= 29)&(_playerResultCounter <= 40))  {
          _userLevel = _resultLevel[2];
        } else if ((_playerResultCounter >= 41)&(_playerResultCounter <= 52)) {
          _userLevel = _resultLevel[1];
        } else if (_playerResultCounter >= 53) {
          _userLevel = _resultLevel[0];
        }
        break;
      case 5:
        if (_playerResultCounter <= 35) {
          _userLevel = _resultLevel[3];
        } else if ((_playerResultCounter >= 36)&(_playerResultCounter <= 50))  {
          _userLevel = _resultLevel[2];
        } else if ((_playerResultCounter >= 51)&(_playerResultCounter <= 65))  {
          _userLevel = _resultLevel[1];
        }  else if (_playerResultCounter >= 66) {
          _userLevel = _resultLevel[0];
        }
        break;
    }
    return _userLevel;
  }

  void checkUserLevel(){
    switch (_igrokHod){
      case 1:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 2;
            break;
          case 1:
            _igrokLevel = 3;
            break;
          case 2:
            _igrokLevel = 3;
            break;
        }
        break;
      case 2:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 2;
            break;
          case 1:
            _igrokLevel = 3;
            break;
          case 2:
            _igrokLevel = 3;
            break;
          case 3:
            _igrokLevel = 4;
            break;
          case 4:
            _igrokLevel = 4;
            break;
        }
        break;
      case 3:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 2;
            break;
          case 1:
            _igrokLevel = 2;
            break;
          case 2:
            _igrokLevel = 3;
            break;
          case 3:
            _igrokLevel = 3;
            break;
          case 4:
            _igrokLevel = 4;
            break;
          case 5:
            _igrokLevel = 4;
            break;
          case 6:
            _igrokLevel = 4;
            break;
        }
        break;
      case 4:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 2;
            break;
          case 1:
            _igrokLevel = 2;
            break;
          case 2:
            _igrokLevel = 2;
            break;
          case 3:
            _igrokLevel = 3;
            break;
          case 4:
            _igrokLevel = 3;
            break;
          case 5:
            _igrokLevel = 3;
            break;
          case 6:
            _igrokLevel = 4;
            break;
          case 7:
            _igrokLevel = 4;
            break;
          case 8:
            _igrokLevel = 4;
            break;
        }
        break;
      case 5:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 2;
            break;
          case 2:
            _igrokLevel = 2;
            break;
          case 3:
            _igrokLevel = 2;
            break;
          case 4:
            _igrokLevel = 3;
            break;
          case 5:
            _igrokLevel = 3;
            break;
          case 6:
            _igrokLevel = 3;
            break;
          case 7:
            _igrokLevel = 3;
            break;
          case 8:
            _igrokLevel = 4;
            break;
          case 9:
            _igrokLevel = 4;
            break;
          case 10:
            _igrokLevel = 4;
            break;
        }
        break;
      case 6:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 2;
            break;
          case 2:
            _igrokLevel = 2;
            break;
          case 3:
            _igrokLevel = 2;
            break;
          case 4:
            _igrokLevel = 2;
            break;
          case 5:
            _igrokLevel = 3;
            break;
          case 6:
            _igrokLevel = 3;
            break;
          case 7:
            _igrokLevel = 3;
            break;
          case 8:
            _igrokLevel = 3;
            break;
          case 9:
            _igrokLevel = 4;
            break;
          case 10:
            _igrokLevel = 4;
            break;
        }
        break;
      case 7:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 1;
            break;
          case 2:
            _igrokLevel = 2;
            break;
          case 3:
            _igrokLevel = 2;
            break;
          case 4:
            _igrokLevel = 2;
            break;
          case 5:
            _igrokLevel = 2;
            break;
          case 6:
            _igrokLevel = 3;
            break;
          case 7:
            _igrokLevel = 3;
            break;
          case 8:
            _igrokLevel = 3;
            break;
          case 9:
            _igrokLevel = 3;
            break;
          case 10:
            _igrokLevel = 4;
            break;
        }
        break;
      case 8:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 1;
            break;
          case 2:
            _igrokLevel = 2;
            break;
          case 3:
            _igrokLevel = 2;
            break;
          case 4:
            _igrokLevel = 2;
            break;
          case 5:
            _igrokLevel = 2;
            break;
          case 6:
            _igrokLevel = 2;
            break;
          case 7:
            _igrokLevel = 3;
            break;
          case 8:
            _igrokLevel = 3;
            break;
          case 9:
            _igrokLevel = 3;
            break;
          case 10:
            _igrokLevel = 3;
            break;
        }
        break;
      case 9:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 1;
            break;
          case 2:
            _igrokLevel = 1;
            break;
          case 3:
            _igrokLevel = 2;
            break;
          case 4:
            _igrokLevel = 2;
            break;
          case 5:
            _igrokLevel = 2;
            break;
          case 6:
            _igrokLevel = 2;
            break;
          case 7:
            _igrokLevel = 2;
            break;
          case 8:
            _igrokLevel = 3;
            break;
          case 9:
            _igrokLevel = 3;
            break;
          case 10:
            _igrokLevel = 3;
            break;
        }
        break;
      case 10:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 1;
            break;
          case 2:
            _igrokLevel = 1;
            break;
          case 3:
            _igrokLevel = 1;
            break;
          case 4:
            _igrokLevel = 1;
            break;
          case 5:
            _igrokLevel = 2;
            break;
          case 6:
            _igrokLevel = 2;
            break;
          case 7:
            _igrokLevel = 2;
            break;
          case 8:
            _igrokLevel = 2;
            break;
          case 9:
            _igrokLevel = 3;
            break;
          case 10:
            _igrokLevel = 3;
            break;
        }
        break;
      case 11:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 1;
            break;
          case 2:
            _igrokLevel = 1;
            break;
          case 3:
            _igrokLevel = 1;
            break;
          case 4:
            _igrokLevel = 1;
            break;
          case 5:
            _igrokLevel = 1;
            break;
          case 6:
            _igrokLevel = 1;
            break;
          case 7:
            _igrokLevel = 2;
            break;
          case 8:
            _igrokLevel = 2;
            break;
          case 9:
            _igrokLevel = 2;
            break;
          case 10:
            _igrokLevel = 2;
            break;
        }
        break;
      case 12:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 1;
            break;
          case 2:
            _igrokLevel = 1;
            break;
          case 3:
            _igrokLevel = 1;
            break;
          case 4:
            _igrokLevel = 1;
            break;
          case 5:
            _igrokLevel = 1;
            break;
          case 6:
            _igrokLevel = 1;
            break;
          case 7:
            _igrokLevel = 1;
            break;
          case 8:
            _igrokLevel = 2;
            break;
          case 9:
            _igrokLevel = 2;
            break;
          case 10:
            _igrokLevel = 2;
            break;
        }
        break;
      case 13:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 1;
            break;
          case 2:
            _igrokLevel = 1;
            break;
          case 3:
            _igrokLevel = 1;
            break;
          case 4:
            _igrokLevel = 1;
            break;
          case 5:
            _igrokLevel = 1;
            break;
          case 6:
            _igrokLevel = 1;
            break;
          case 7:
            _igrokLevel = 1;
            break;
          case 8:
            _igrokLevel = 1;
            break;
          case 9:
            _igrokLevel = 1;
            break;
          case 10:
            _igrokLevel = 2;
            break;
        }
        break;
      case 14:
        switch (_userWinCounter){
          case 0:
            _igrokLevel = 1;
            break;
          case 1:
            _igrokLevel = 1;
            break;
          case 2:
            _igrokLevel = 1;
            break;
          case 3:
            _igrokLevel = 1;
            break;
          case 4:
            _igrokLevel = 1;
            break;
          case 5:
            _igrokLevel = 1;
            break;
          case 6:
            _igrokLevel = 1;
            break;
          case 7:
            _igrokLevel = 1;
            break;
          case 8:
            _igrokLevel = 1;
            break;
          case 9:
            _igrokLevel = 1;
            break;
          case 10:
            _igrokLevel = 1;
            break;
        }
        break;
    }
  }

  @override
  void initState(){
    super.initState();
    setAddrToFigure ();
  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20.0,),
              Container(
                height: 40.0,
                child: Text('Уровень 2', style: TextStyle(color: Colors.black, fontSize: 30.0),),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: (){
                            if(!_kvadratClick) {
                              setState(() {
                                _kvadratClick = true;
                                sentButtonPressParameter (1);
                              });
                            }
                          },
                          child:
                          (!_kvadratClick) ? GlassBox(imageFig: _imgKvadrat):GlassBoxPressed(imageFig: _imgKvadrat),
                        ),
                        GestureDetector(
                          onTap: (){
                            if (!_krugClick) {
                              setState(() {
                                _krugClick = true;
                                sentButtonPressParameter (2);
                              });
                            }
                          },
                          child:
                          (!_krugClick) ? GlassBox(imageFig: _imgKrug): GlassBoxPressed(imageFig: _imgKrug),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Center(
                      child:
                        GestureDetector(
                          onTap: (){
                            if(!_treugClick) {
                              setState(() {
                                _treugClick = true;
                                sentButtonPressParameter (3);
                              });
                            }
                          },
                          child:
                          (!_treugClick)? GlassBox(imageFig: _imgTreugolnik,):GlassBoxPressed(imageFig: _imgTreugolnik,),
                        ),
                    ),
                  ],
                ),
              ),
              CustomInfoBar(
                userPoint: _playerResultCounter,
                userLevel: _userLevel,
                roundNumber: _roundNumber.toString(),
                igrokWins: _igrokLevel,
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    SizedBox(height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => SplashRaund(),
                            );
                            if (!_buttonStartClick){
                              setState(() {
                                _buttonStartClick = true;
                              });
                              startGame();
                            }
                          },
                          child:
                          (!_buttonStartClick) ? MenuButtons(buttonText: 'СТАРТ',) : MenuButtonsPressed(buttonText: 'СТАРТ',),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
                          },
                          child: MenuButtons(buttonText: 'УРОВНИ',),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              endGame();
                            });
                          },
                          child: MenuButtons(buttonText: 'СТОП',),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
