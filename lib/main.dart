//the imports that we need
import 'package:flutter/material.dart';
import 'CardList.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  home: CardGame(),
));

class CardGame extends StatefulWidget {
  const CardGame({Key? key}) : super(key: key);

  @override
  State<CardGame> createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  final List<Carder> card =List.from(Cardlist);
  List<String> RightCard = [
    'assets/card.png',
    'assets/card.png',
    'assets/card.png',
    'assets/card.png',
    'assets/card.png'
  ];

  //these are the valuables that we need
  int ninjaLevel = 0;
  Random random = Random();
  int randomNumber = 34;
  int score = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      appBar: AppBar(
        title: Text('CARD GAME',
            style: TextStyle(fontWeight: FontWeight.bold )),
        centerTitle: true,
        backgroundColor: Colors.green[900],
        elevation:0,
      ),

      body: Column(
        children: <Widget>[
          //PART 1 - Score Tally
          Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Guess the Card",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  SizedBox(height: 5.0),
                  Text(
                    'SCORE $score',
                    style: TextStyle(
                      color: Colors.amberAccent[200],
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            )
          ),
          //END OF PART 1

          //PART 2 - two cards
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                //Given Card
                Expanded(flex: 1, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(card[randomNumber].urlImage),
                  )
                ),
                //Guess Card
                Expanded(flex: 1, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(card[randomNumber].urlImage),
                )
                ),
              ],
            ),
          ),
          //END OF PART 2

          //PART RIGHT GUESS
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Row(
                children: <Widget>[
                  //Right Guess Card 1
                  Expanded(flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(RightCard[0]),
                      )
                  ),
                  //Right Guess Card 2
                  Expanded(flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(RightCard[1]),
                      )
                  ),
                  //Right Guess Card 3
                  Expanded(flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(RightCard[2]),
                      )
                  ),
                  //Right Guess Card 4
                  Expanded(flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(RightCard[3]),
                      )
                  ),
                  //Right Guess Card 4
                  Expanded(flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Image.asset(RightCard[4]),
                      )
                  ),
                ],
              ),
            ),
          ),
          //END OF PART 3

          //BUTTONS

          Expanded(
            flex: 1,
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              //GREATER BUTTON
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style:ButtonStyle(
                      foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){
                      setState((){
                        int prev = card[randomNumber].value;
                        randomNumber = random.nextInt(51);
                        if(card[randomNumber].value > prev){
                          for(int a = 0; a < 4; a++)
                          {
                            RightCard[a] = RightCard[a+1];
                          }
                          RightCard[4]=card[randomNumber].urlImage;
                          score++;
                        }
                      });
                    },
                    child: Text('GREATER'),
                  ),
                ),
              ),

              //EQUAL BUTTON
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style:ButtonStyle(
                      foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){
                      setState((){
                        int prev = card[randomNumber].value;
                        randomNumber = random.nextInt(51);
                        if(card[randomNumber].value == prev){
                          for(int a = 0; a < 4; a++)
                          {
                            RightCard[a] = RightCard[a+1];
                          }
                          RightCard[4]=card[randomNumber].urlImage;
                          score++;
                        }
                      });
                    },
                    child: Text('GREATER'),
                  ),
                ),
              ),
              //LESSER BUTTON
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style:ButtonStyle(
                      foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: (){
                      setState((){
                        int prev = card[randomNumber].value;
                        randomNumber = random.nextInt(51);
                        if(card[randomNumber].value < prev){
                          for(int a = 0; a < 4; a++)
                          {
                            RightCard[a] = RightCard[a+1];
                          }
                          RightCard[4]=card[randomNumber].urlImage;
                          score++;
                        }
                      });
                    },
                    child: Text('LESSER'),
                  ),
                ),
              ),
            ],
            ),
          ),
        ],
      ),
    );
  }
}



