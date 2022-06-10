import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'game.dart';
import 'parts.dart';


class LevelUpPage extends StatefulWidget {

  @override
  State<LevelUpPage> createState() => _LevelUpPageState();
}

class _LevelUpPageState extends State<LevelUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(

            constraints: const BoxConstraints.expand(),
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/back_levelup.jpg"),opacity: .9, fit: BoxFit.cover)),
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
      ),
    );


  }
  Widget portrait(){
    return Column(
      children: [
       part1(),
       part2(),
        WillPopScope(
          onWillPop: _onWillPop, child: Text(""),
        ),
      ],
    );
  }
  Widget landscape(){
    return Row(

      children: [
        part1(),
        part2(),
        WillPopScope(
          onWillPop: _onWillPop, child: Text(""),
        ),
      ],
    );
  }

  Widget part1(){
    return  Expanded(flex: 1, child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(flex: 1, child: Image.asset('assets/logo_levelup.png'),),
            Row(children: [display(score, "assets/logo_score.png"), display(level, "assets/logo_level.png"), display(life, "assets/logo_life.png"),])
          ],
        )
    )
    );
  }
  Widget part2(){
    return Expanded( flex: 1, child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          child: Text("CONTINUE"),
          onPressed: () {
            setState(() {
              guess="~";
              level++; //Add level
              life += 2; //Every Next Level Add 5
              for(int a = 0; a <5; a++){ //Change back to empty Right Cards
                RightCard[a] = 'assets/card.png';
              }
            });

            Navigator.of(context).pushNamed(
              '/game', arguments: 'Hello there from the first page!',
            );
          },
        ),
        ElevatedButton(
          child: Text("  QUIT  "),
          onPressed: () {
            dialog();
          },
        ),
      ],
    ),
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

