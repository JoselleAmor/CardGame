//the imports that we need
import 'package:flutter/material.dart';
import 'CardList.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  home: NinjaCard(),
));

class NinjaCard extends StatefulWidget {
  const NinjaCard({Key? key}) : super(key: key);

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
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

          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(flex: 1, child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(card[randomNumber].urlImage,
                    opacity:  AlwaysStoppedAnimation<double>(1)),

                )),
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

              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Image.asset(RightCard[0]),
                    )),
                Expanded(flex: 1,
                    child: Image.asset(RightCard[1])),
               ],
            ),
          ),

          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                Expanded(flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Image.asset(RightCard[2]),
                    )),
                Expanded(flex: 1,
                    child: Image.asset(RightCard[3])),
                Expanded(flex: 1,
                    child: Image.asset(RightCard[4])),
              ],
            ),
          ),
        ],
      ),




       //For the buttons
       bottomNavigationBar: BottomAppBar(
         color: Colors.green[900],
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[
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
                       if(card[randomNumber].value >= prev){
                         for(int a = 0; a < 4; a++)
                         {
                           RightCard[a] = RightCard[a+1];
                         }
                         RightCard[4]=card[randomNumber].urlImage;
                         score++;
                       }
                     });
                   },
                   child: Text('GREATER OR EQUAL'),
                 ),
               ),
             ),


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

    );
  }
}



