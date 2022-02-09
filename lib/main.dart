// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'game.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }

}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
   var textstyle = const TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'ArchitectsDaughter',fontWeight: FontWeight.w700);
  var textstyle1 = const TextStyle(color: Colors.black,fontSize: 30,fontFamily: 'ArchitectsDaughter',fontWeight: FontWeight.w700);
  var textstyle2 = const TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'ArchitectsDaughter',fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    final color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor:  Colors.blueAccent[200],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Container(
                      child: Text(
                        "TIC TAC TOE",
                        style: textstyle1
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      child: Container(
                       
                            child: Image.asset(
                              'lib/assets/tic.JPG',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                  )
                ),
                
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => game()),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: Colors.blueAccent[200],
                        child: Center(
                          child: Container(
                          child: Text(
                            'PLAY GAME',
                             style: textstyle1
                            
                          ),
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent[200],
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade600,
                                offset: Offset(5,5),
                                blurRadius: 15,
                                spreadRadius: 2
                              ),
                               
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-3
                                ,-3),
                                blurRadius: 15,
                                spreadRadius: 2
                              )
                            
                            ]
                            
                          ),
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text('MADE BY A PRABHAS KUMAR', style: textstyle2,)
              ],
            ),
          )),
    );
  }
}

