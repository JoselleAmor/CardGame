import 'package:flutter/material.dart';

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
Widget playButton(bool a,void b(), void e(), String c){
  void run(){
    e();
    b();
  }
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style:ButtonStyle(

        ),
        onPressed: a ? null : run,
        child: Text(c),
      ),
    ),
  );
}

//score things
Widget display(int a, String b){
  return Expanded(
    flex: 1,
    child: Center(
      child: Column(
        children: [
          Text(
            '$b',
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$a',
            style: TextStyle(
              color: Colors.amberAccent[200],
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}