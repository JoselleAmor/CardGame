//the imports that we need
import 'package:flutter/material.dart';
import 'CardList.dart';
import 'parts.dart';
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
  Random random = Random();
  int randomNumber = 0;
  int score = 0, life = 5;
  int operation = 0;
  var pair = [52,52];
  String guess = '~'; //show your guess
  bool guessCard = false;
  bool coverCard = true;
  bool _isNextDisabled = true;
  bool _isSolveDisabled = false;

  bool GameButton = false;
  bool StartButton = true;
  double startopacity = .5;






  @override

  void start(){
    setState(() {
      GameButton = true;
      StartButton = false;
      startopacity = 1;
      pair[0] = random.nextInt(51);
      pair[1] = random.nextInt(51);
    });

  }
  bool status = false;
  void greater()=> operation = 0;
  void equal() => operation = 1;
  void lesser() => operation = 2;
  void solve(){
    if(operation == 0){
      if (card[pair[0]].value > card[pair[1]].value){
        _isNextDisabled = false;
        _isSolveDisabled = true;
        status = true;
        rotate(">");
      }else{
        setState((){
          pair[0] = random.nextInt(51);
          pair[1] = random.nextInt(51);
          life--;
        });
      }
    }
    else if (operation == 1){
      if (card[pair[0]].value == card[pair[1]].value){
        _isNextDisabled = false;
        _isSolveDisabled = true;
        status = true;
        rotate("=");
      }else{
        setState((){
          pair[0] = random.nextInt(51);
          pair[1] = random.nextInt(51);
          life--;
        });
      }

    }
    else if (operation == 2){
      if (card[pair[0]].value < card[pair[1]].value){
        _isNextDisabled = false;
        _isSolveDisabled = true;
        status = true;
        rotate("<");
      }else{
        setState((){
          pair[0] = random.nextInt(51);
          pair[1] = random.nextInt(51);
          life--;
        });
      }

    }
  }


  void rotate(String b){
    setState(() {
      guessCard = true;
      coverCard = false;
      guess = b;
        for (int a = 0; a < 4; a++) {
          RightCard[a] = RightCard[a + 1];
        }
        RightCard[4] = card[pair[0]].urlImage;
        score++;
    });
  }


  void next(){
    setState(() {
      pair[0] = random.nextInt(51);
      pair[1] = random.nextInt(51);
      guessCard = false;
      coverCard = true;
      guess = "~";
    });
    _isNextDisabled = true;
    _isSolveDisabled = false;
  }



  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green[800],
      appBar: AppBar(
      ),

      body: Column(
        children: <Widget>[
          //PART 1 - Score Tally
          Expanded(flex: 1, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(flex:1,child:  Image.asset('assets/logo.png'),),
                  Row(children: [display(score, "SCORE"), display(life, "LIFE"),])
                ],
              )
            )
          ),
          //END OF PART 1

          //PART 2 - two cards
          Expanded(
            flex: 2,
            child: AnimatedOpacity(
              duration: Duration(seconds: 1),
              opacity: startopacity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Given Card
                  Expanded(flex: 2, child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(card[pair[0]].urlImage),
                  )
                  ),
                  Expanded(flex:1, child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(guess,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.normal,
                              shadows:[Shadow(color:Colors.black54, offset:Offset(1,2), blurRadius: 4 ) ]
                          )),
                      ElevatedButton(onPressed: _isNextDisabled ? null : next,
                      child: Icon(IconData(0xe1ff, fontFamily: 'MaterialIcons')),
                      )
                    ],

                  )

                  ),
                  //Guess Card
                  Expanded(flex: 2, child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(card[52].urlImage),
                      ), visible: coverCard),
                      Visibility(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(card[pair[1]].urlImage),
                      ), visible: guessCard),
                    ],
                  ),
                  ),
                ],
              ),
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
                  //Right Guess Card
                  card5(RightCard[0]),
                  card5(RightCard[1]),
                  card5(RightCard[2]),
                  card5(RightCard[3]),
                  card5(RightCard[4]),
                ],
              ),
            ),
          ),
          //END OF PART 3

          //BUTTONS
          Visibility(
            child: Expanded(
              flex: 1,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                playButton(_isSolveDisabled,greater, solve, 'GREATER'), //GREATER BUTTON
                playButton(_isSolveDisabled,equal, solve, 'EQUAL'), //EQUAL BUTTON
                playButton(_isSolveDisabled,lesser, solve, 'LESSER'), //LESSER BUTTON
              ],
              ),
            ),
            visible: GameButton,
          ),

          //START BUTTON
          Visibility(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style:ButtonStyle(
                    foregroundColor:MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: (){
                    setState((){
                          start();
                    });
                  },
                  child: Text('START'),
                ),
              ),
            ),
            visible: StartButton,
          ),
        ],
      ),
    );
  }
}



