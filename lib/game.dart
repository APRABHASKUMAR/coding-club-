// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class game extends StatefulWidget {
 @override
  _gameState createState() => _gameState();
}

class _gameState extends State<game> {
    bool whoseturn = true;
    List<String> displaychar = [' ',' ',' ',' ',' ',' ',' ',' ',' '];  
    int filledboxes = 0;
    int scoreofo = 0;
    int scoreofx = 0;
    bool win = false;
    var textstyle = const TextStyle(color: Colors.white,fontSize: 30,fontFamily: 'ArchitectsDaughter',fontWeight: FontWeight.w700);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[200],
      // ignore: prefer_const_constructors
     body: Column(
        children: <Widget>[
          const SizedBox(height: 15,),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player O', style: textstyle,),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(scoreofo.toString(), style: textstyle,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Player X', style: textstyle),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(scoreofx.toString(), style: textstyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
             child: GridView.builder(
              itemCount: 9,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
              itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap:() {_tapped(index);},
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.white)),
                  child: Center(child: Text(displaychar[index],style: const TextStyle(color: Colors.white, fontSize: 40),),
                  ),
                  ),
                );
              }),
           ),
             RaisedButton(
  onPressed: () {
   SystemNavigator.pop();
  },
  child: Text("Exit")
)
         ],
        ),
    );
  }
     void _tapped(int index) {
        setState(() {
         if (whoseturn && displaychar[index] == ' ') {
           displaychar[index] = 'o';
           filledboxes ++;
           whoseturn = !whoseturn;

           }
           else if (!whoseturn && displaychar[index] == ' '){
            displaychar[index] = 'x';
            filledboxes++;
            whoseturn = !whoseturn;
           };
           
           _checkwinner();
        });
      }
      void _checkwinner() {
        if ( displaychar[0] == displaychar[1] &&
             displaychar[0] == displaychar[2] &&    // row 1
             displaychar[0] != ' ') {
               _showresult(displaychar[0]);
               win = true;

             }
          if ( displaychar[3] == displaychar[4] &&
             displaychar[4] == displaychar[5] &&    // row 2
             displaychar[4] != ' ') {
               _showresult(displaychar[3]);
                win = true;
             }
          if ( displaychar[6] == displaychar[7] &&
             displaychar[7] == displaychar[8] &&    // row 3
             displaychar[7] != ' ') {
               _showresult(displaychar[6]);
                win = true;
             }
            if ( displaychar[0] == displaychar[3] &&
             displaychar[0] == displaychar[6] &&    // col 1
             displaychar[0] != ' ') {
               _showresult(displaychar[0]);
                win = true;
             }
            if ( displaychar[1] == displaychar[4] &&
             displaychar[4] == displaychar[7] &&    // col 2
             displaychar[1] != ' ') {
               _showresult(displaychar[1]);
                win = true;
             }
            if ( displaychar[2] == displaychar[5] &&
             displaychar[5] == displaychar[8] &&    // col 3
             displaychar[2] != ' ') {
               _showresult(displaychar[2]);
                win = true;
             }
              if ( displaychar[0] == displaychar[4] &&
             displaychar[4] == displaychar[8] &&    // diag 1
             displaychar[0] != ' ') {
               _showresult(displaychar[0]);
                win = true;
             }
              if ( displaychar[2] == displaychar[4] &&
             displaychar[4] == displaychar[6] &&    // diag 2
             displaychar[2] != ' ') {
               _showresult(displaychar[2]);
                win = true;
             }
             else if (filledboxes == 9 && !win){
               _showdraw();
             }
      }
      void _showresult(String winner) {
            showDialog(
              barrierDismissible: false,
              context: context,
             builder: (BuildContext context){
               return AlertDialog(
                 title: Text('winner is  $winner'),
                 actions:<Widget> [FlatButton(
                   child: Text('play again!'),
                   onPressed: (){_restart();
                   Navigator.of(context).pop();}
                 )]
               );
             }
             );
              if (winner == 'o') {
              scoreofo++;
      }
      else if (winner == 'x') {
        scoreofx++;
      }
      }
      void _showdraw() {
        showDialog(
          context: context,
         builder: (BuildContext context){
           return const AlertDialog(
             title: const Text('match draw'),
           );
         }
        );
        
      }
      void _restart() {
        setState(() {
        for (int i=0; i < 9 ; i++) {
          displaychar[i] = ' ';
          filledboxes = 0;
        }  
        });
        
      }
     
    } 