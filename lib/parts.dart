import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

//these are the variables that we need
Random random = Random();
int randomNumber = 0;
int score = 0, life = 5, level = 0;
int BG = 0; //Background Number
bool _first = false;
var pair = [0,52];
String guess = '~'; //show your guess
bool guessCard = false;
bool coverCard = true;
double startopacity = .5;



//assets for the 51 cards
class Carder{
  final int value;
  final String urlImage;

  const Carder({
    required this.value,
    required this.urlImage,
  });
}


//This is the list of instances of the carder class
//containing all the asset

final List<Carder> Cardlist = [
  Carder(value: 1, urlImage: 'assets/AC.png'),
  Carder(value: 1, urlImage: 'assets/AD.png'),
  Carder(value: 1, urlImage: 'assets/AH.png'),
  Carder(value: 1, urlImage: 'assets/AS.png'),
  Carder(value: 2, urlImage: 'assets/2C.png'),
  Carder(value: 2, urlImage: 'assets/2D.png'),
  Carder(value: 2, urlImage: 'assets/2H.png'),
  Carder(value: 2, urlImage: 'assets/2S.png'),
  Carder(value: 3, urlImage: 'assets/3C.png'),
  Carder(value: 3, urlImage: 'assets/3D.png'),
  Carder(value: 3, urlImage: 'assets/3H.png'),
  Carder(value: 3, urlImage: 'assets/3S.png'),
  Carder(value: 4, urlImage: 'assets/4C.png'),
  Carder(value: 4, urlImage: 'assets/4D.png'),
  Carder(value: 4, urlImage: 'assets/4H.png'),
  Carder(value: 4, urlImage: 'assets/4S.png'),
  Carder(value: 5, urlImage: 'assets/5C.png'),
  Carder(value: 5, urlImage: 'assets/5D.png'),
  Carder(value: 5, urlImage: 'assets/5H.png'),
  Carder(value: 5, urlImage: 'assets/5S.png'),
  Carder(value: 6, urlImage: 'assets/6C.png'),
  Carder(value: 6, urlImage: 'assets/6D.png'),
  Carder(value: 6, urlImage: 'assets/6H.png'),
  Carder(value: 6, urlImage: 'assets/6S.png'),
  Carder(value: 7, urlImage: 'assets/7C.png'),
  Carder(value: 7, urlImage: 'assets/7D.png'),
  Carder(value: 7, urlImage: 'assets/7H.png'),
  Carder(value: 7, urlImage: 'assets/7S.png'),
  Carder(value: 8, urlImage: 'assets/8C.png'),
  Carder(value: 8, urlImage: 'assets/8D.png'),
  Carder(value: 8, urlImage: 'assets/8H.png'),
  Carder(value: 8, urlImage: 'assets/8S.png'),
  Carder(value: 9, urlImage: 'assets/9C.png'),
  Carder(value: 9, urlImage: 'assets/9D.png'),
  Carder(value: 9, urlImage: 'assets/9H.png'),
  Carder(value: 9, urlImage: 'assets/9S.png'),
  Carder(value: 10, urlImage: 'assets/10C.png'),
  Carder(value: 10, urlImage: 'assets/10D.png'),
  Carder(value: 10, urlImage: 'assets/10H.png'),
  Carder(value: 10, urlImage: 'assets/10S.png'),
  Carder(value: 11, urlImage: 'assets/JC.png'),
  Carder(value: 11, urlImage: 'assets/JD.png'),
  Carder(value: 11, urlImage: 'assets/JH.png'),
  Carder(value: 11, urlImage: 'assets/JS.png'),
  Carder(value: 12, urlImage: 'assets/QC.png'),
  Carder(value: 12, urlImage: 'assets/QD.png'),
  Carder(value: 12, urlImage: 'assets/QH.png'),
  Carder(value: 12, urlImage: 'assets/QS.png'),
  Carder(value: 13, urlImage: 'assets/KC.png'),
  Carder(value: 13, urlImage: 'assets/KD.png'),
  Carder(value: 13, urlImage: 'assets/KH.png'),
  Carder(value: 13, urlImage: 'assets/KS.png'),
  Carder(value: 14, urlImage: 'assets/back.png')
];

List<Widget> BackGround = [

];
List<String> LevelBackground = [
  'assets/back_b1.jpg',
  'assets/back_b5.jpg',
  'assets/back_b6.jpg',
  'assets/back_b7.jpg',
  'assets/back_b8.jpg',
];
List<String> RightCard = [
  'assets/card.png',
  'assets/card.png',
  'assets/card.png',
  'assets/card.png',
  'assets/card.png'
];





//parts of the app that are repeating in nature
//Lower 5 cards
Widget card5(String s){
  return Expanded(flex: 1,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(s),
      )
  );
}

//buttons for guessing
Widget playButton(bool a,void b(),String c){
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style:ButtonStyle(

        ),
        onPressed: a ? null : b,
        child: Text(c),
      ),
    ),
  );
}

//score things
Widget display(int a, String b){
  return Expanded(
    flex: 1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(b),
        Text(
          '$a',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2.0,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

//Quit Button
Widget Quit(){
  return ElevatedButton(
    onPressed: () {
      SystemNavigator.pop();
    },
    child: Text("QUIT"),
  );
}