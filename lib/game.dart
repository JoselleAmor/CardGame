import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'parts.dart';
import 'levelUp.dart';



class GamePage extends StatefulWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  final String data;
  GamePage({
    required this.data,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}



class _GamePageState extends State<GamePage> {
  final List<Carder> card = List.from(Cardlist);

  bool _isNextDisabled = true;
  bool _isSolveDisabled = false;

  @override
  void greater() {
    if (card[pair[0]].value > card[pair[1]].value) {
      rotate(">");
    } else {
      wrongGuess();
    }
    if(life == 0) {
      Navigator.of(context).pushNamed(
        '/gameover',
      );
    }
  }

  void equal() {
    if (card[pair[0]].value == card[pair[1]].value) {
      rotate("=");
    } else {
      wrongGuess();
    }
    if(life == 0) {
      Navigator.of(context).pushNamed(
        '/gameover',
      );
    }
  }

  void lesser() {
    if (card[pair[0]].value < card[pair[1]].value) {
      rotate("<");
    } else {
      wrongGuess();
    }
    if(life == 0) {
      Navigator.of(context).pushNamed(
        '/gameover',
      );
    }
  }

  void wrongGuess() {
    setState(() {
      pair[0] = random.nextInt(50);
      pair[1] = random.nextInt(50);
      life--;
    });
  }

  void rotate(String b) {
    setState(() {
      guessCard = true;
      coverCard = false;
      guess = b;
      _isNextDisabled = false;
      _isSolveDisabled = true;
      for (int a = 0; a < 4; a++) {
        RightCard[a] = RightCard[a + 1];
      }
      RightCard[4] = card[pair[0]].urlImage;
      score++;
      if(score%5 == 0){
        if(BG > 4) BG=0;  //Change Background
        else BG++;
        guessCard = false;
        coverCard = true;
        Navigator.of(context).pushNamed(
          '/levelUp',
        );

      }
    });
  }

  void next() {
    setState(() {
      pair[0] = random.nextInt(50);
      pair[1] = random.nextInt(50);
      guessCard = false;
      coverCard = true;
      guess = "~";
    });
    _isNextDisabled = true;
    _isSolveDisabled = false;
  }

  //override for the back button
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Think Twice'),
        content: new Text('End the adventurev now?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text("No!"),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: new Text("Yes,"),
          ),
        ],
      ),
    )) ?? false;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration:  BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(LevelBackground[BG]),opacity: .9, fit: BoxFit.cover)),
          child: Center(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth > constraints.maxHeight) {
                    return landscape();
                  } else {
                    return portrait();
                  }
                },
              )
          ),
        ),

          floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton:  Padding(
          padding: const EdgeInsets.fromLTRB(0,10,0,0),
          child: FloatingActionButton(
            heroTag: 'uniqueTag',
            child: const Icon(IconData(0xe318, fontFamily: 'MaterialIcons')),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/',
                  arguments: 'Hello there from the first page!',
                );
              },
          ),
        )
      ),
    );
  }


  //PART 1 - LOGO, SCORE, LIFE AND LEVEL
  Widget part1(){
    return Expanded(flex: 1, child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: Image.asset('assets/logo_logo.png'),),
            Row(children: [display(score, "assets/logo_score.png"), display(level, "assets/logo_level.png"), display(life, "assets/logo_life.png"),])
          ],
        )
    )
    );
  }
  //PART 2 - TWO CARDS
  Widget part2(){
    return  Expanded(
      flex: 2,
      child: AnimatedOpacity(
        opacity: startopacity,
        duration: const Duration(milliseconds: 750),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //Given Card
            Expanded(flex: 2, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(card[pair[0]].urlImage),
            )
            ),
            Expanded(flex: 1, child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(guess,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        shadows: [Shadow(color: Colors.black54,
                            offset: Offset(1, 2),
                            blurRadius: 4)
                        ]
                    )),
                ElevatedButton(onPressed: _isNextDisabled ? null : next,
                  child: const Icon(
                      IconData(0xe1ff, fontFamily: 'MaterialIcons')),
                )
              ],

            )

            ),
            //Guess Card
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Visibility(
                    child: Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(card[52].urlImage),
                      ),
                    ),
                    visible: coverCard,
                  ),

                  Visibility(
                      child: Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(card[pair[1]].urlImage),
                        ),
                      ),
                      visible: guessCard
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  //PART 3 - 5 RIGHT CARDS
  Widget part3(){
    return Expanded(
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
    );
  }
  //PART 4 - BUTTONS
  Widget part4(){
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          playButton(_isSolveDisabled, greater, 'GREATER'), //GREATER BUTTON
          playButton(_isSolveDisabled, equal, 'EQUAL'), //EQUAL BUTTON
          playButton(_isSolveDisabled, lesser, 'LESSER'), //LESSER BUTTON
        ],
      ),
    );
  }



  Widget portrait() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        part1(), //PART 1 - LOGO, SCORE, LIFE, LEVEL
        part3(), //PART 3 - 5 RIGHT CARDS
        part2(), //PART 2 - TWO CARDS
        part4(), //PART4 - BUTTONS
        WillPopScope(
          onWillPop: _onWillPop, child: const Text(""),
        ),
      ],
    );
  }
  Widget landscape() {
    return Row(
      children: [
        Expanded( flex: 1,
          child: Column(
            children: [
              part1(),
              part3(),
              //END OF PART 3
            ],
          ),
        ),

        Expanded(
          flex: 1,
          child: Column(
            children: [
              const SizedBox( height: 50),
              part2(),
              part4(),
              const SizedBox( height: 50),
            ],
          ),
        ),
        WillPopScope(
          onWillPop: _onWillPop, child: const Text(""),
        ),
      ],
    );
  }
}
