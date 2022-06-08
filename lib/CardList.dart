//this is the class for the value and image tandem
import 'package:flutter/material.dart';

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
  Carder(value: 0, urlImage: 'assets/back.png')
];

Widget widgetText(){
  return Text("Guess the Card",
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ));
}