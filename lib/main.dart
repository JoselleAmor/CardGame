import 'package:flutter/material.dart';
import 'pageNavigator.dart';
import 'parts.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

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

//initialize images
class GameImages{
  static const String Ipath = "assets/";
  static const String back_open = Ipath+"back_open.jpg";
  static const String back_levelup = Ipath+"back_levelup.jpg";
  static const String back_gameover = Ipath+"back_gameover.jpg";
  static const String back_b1 = Ipath+"back_b1.jpg";
  static const String back_b2 = Ipath+"back_b2.jpg";
  static const String back_b5 = Ipath+"back_b5.jpg";
  static const String back_b6 = Ipath+"back_b6.jpg";
  static const String back_b7 = Ipath+"back_b7.jpg";
  static const String back_b8 = Ipath+"back_b8.jpg";
}



class StartPage extends StatefulWidget {
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {


  final _text = TextEditingController();
  bool _validate = false;


  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

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
              /* attempt for name
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: _text,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w600),
                        maxLength: 15,
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            filled:true,
                            fillColor: Colors.white.withOpacity(.5),
                            hintText: "Player Name",
                            hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
                            errorText: _validate ? 'Enter Name' : null,
                        ),
                      ),
                    ),
                  ),*/

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
            '\n5. Enjoy!'),
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




