import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'parts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:typed_data';

class gameover extends StatefulWidget {
  const gameover({Key? key}) : super(key: key);

  @override
  State<gameover> createState() => _gameoverState();
}

class _gameoverState extends State<gameover> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body:Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/back_gameover.jpg"),
                  fit: BoxFit.cover)),

          child:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              WillPopScope(
                onWillPop: _onWillPop, child: Text(""),
              ),
              Expanded(flex: 1, child: Image.asset('assets/logo_score.png')),
              Expanded(flex: 2, child: Text(
                '$score',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontSize: 45.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ),
              Expanded(flex: 2, child: Image.asset('assets/logo_gameover.png')),
              Expanded(flex: 2, child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/game', arguments: 'Hello there from the first page!',
                      );
                      setState(() {
                        life = 5;
                        score = 0;
                        level = 0;
                        BG = 0;
                        guessCard = false;
                        coverCard = true;
                        pair[0] = random.nextInt(50);
                        pair[1] = random.nextInt(50);
                        for(int a = 0; a < 5; a++){
                          RightCard[a]='assets/card.png';
                        }
                      });
                    },
                    child: Text("RESTART"),
                  ),
                  Quit(),
                ],
              )
              )
            ],
          )
        )
      )
    );
  }

  Future<bool> _onWillPop() async {
    return (await dialog()) ?? false;
  }


  Future dialog(){
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Think Twice!'),
        content: new Text('Are you sure you want to quit?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text("No"),
          ),
          TextButton(
            onPressed: () {  SystemNavigator.pop(); },
            child: new Text("Yes"),
          ),
        ],
      ),
    );
  }
}
