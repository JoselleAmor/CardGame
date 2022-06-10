// ADVENTURE CARD GUESS GAME
// JOSELL AMOR A. QUINAL
// BSCPE 3B
//
// ENGR. CHRISTIAN LLOYD B. SALON
// INSTRUCTOR
//
// PEC 02 COGNATE ELECTIVE SUBJECT
// LEARNING FLUTTER
//
// DISCLAIMER: THE THEME HERE IS FROM ADVENTURE TIME CARTOON NETWORK
// I DO NOT OWN THESE PHOTOS AND DO NOT CLAIM TO OWN THESE PHOTOS







import 'package:flutter/material.dart';
import 'pageNavigator.dart';
import 'parts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'cardgame',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      // Initially display FirstPage
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}


class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

  @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/back_open.jpg"),
                  fit: BoxFit.cover)),
          child: Scaffold(
            backgroundColor:  Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Hero(tag: 'uniqueTag',
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<
                              RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            ),
                          ),
                        ),
                        child: Icon(Icons.play_arrow_rounded),
                        onPressed: () {
                          /*if( _text.text.isEmpty){
                            _validate = true;
                          }
                          else{
                            _validate = false;*/
                            pair[0] = random.nextInt(50);
                            pair[1] = random.nextInt(50);
                            startopacity = 1;
                            Navigator.of(context).pushNamed(
                              '/game',
                              arguments:"For name sana",
                            );

                        },
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0),
                        ),
                      ),
                    ),
                    onPressed: () { dialog(); },
                    child: Text("SHOW RULES",),

                  ),
                  SizedBox(
                  height: 20,

                  ),

                  WillPopScope(
                    onWillPop: _onWillPop, child: Text(""),
                  ),

                ],
              ),
            ),
          ),
        ),

      );
    }


    //override for the back button
    Future<bool> _onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          title: new Text('Really?'),
          content: new Text('Do you want to end the adventure?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text("No, let's go"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text("Yes, I'll be back"),
            ),
          ],
        ),
      )) ?? false;
    }

  Future dialog(){
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('GAME RULES'),
        content: Text('1. give your best guess on whether the card on the '
            'left is greater, equal, or lesser than the card on the right.'
            '\n2. Every score of 5, you move to next level'
            '\n3. -1 life on every wrong guess.'
            '\n4. +2 life on every new level'
            '\n5. Ace = 1, King = 13, Queen = 12 Jack = 11.'
            '\n6. Enjoy!'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text("Got It!"),
          ),
        ],
      ),
    );
  }
}




