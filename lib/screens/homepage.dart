import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohturn = true;
  List<String> displayexoh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int ohscore = 0;
  int exscore = 0;
  int filledboxes = 0;
  static var MyNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var MyNewFontwhite = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.white, letterSpacing: 3));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player X', style: MyNewFontwhite),
                      SizedBox(
                        height: 10,
                      ),
                      Text(exscore.toString(), style: MyNewFontwhite),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Player O', style: MyNewFontwhite),
                      SizedBox(
                        height: 10,
                      ),
                      Text(ohscore.toString(), style: MyNewFontwhite),
                    ],
                  ),
                ],
              ),
            ),
          )),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displayexoh[index],
                          style: MyNewFontwhite,
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'TIC TAC TOE',
                  style: MyNewFontwhite,
                ),
                Text(
                  '@CreatedbyPhenomes',
                  style: MyNewFontwhite,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohturn && displayexoh[index] == '') {
        displayexoh[index] = 'o';
        filledboxes += 1;
      } else if (!ohturn && displayexoh[index] == '') {
        displayexoh[index] = 'x';
        filledboxes += 1;
      }
      ohturn = !ohturn;
      _winner();
    });
  }

  void _winner() {
    if (displayexoh[0] == displayexoh[1] &&
        displayexoh[0] == displayexoh[2] &&
        displayexoh[0] != '') {
      _dialog(displayexoh[0]);
    }
    if (displayexoh[3] == displayexoh[4] &&
        displayexoh[3] == displayexoh[5] &&
        displayexoh[3] != '') {
      _dialog(displayexoh[3]);
    }
    if (displayexoh[6] == displayexoh[7] &&
        displayexoh[6] == displayexoh[8] &&
        displayexoh[6] != '') {
      _dialog(displayexoh[6]);
    }
    if (displayexoh[0] == displayexoh[3] &&
        displayexoh[0] == displayexoh[6] &&
        displayexoh[0] != '') {
      _dialog(displayexoh[0]);
    }
    if (displayexoh[1] == displayexoh[4] &&
        displayexoh[1] == displayexoh[7] &&
        displayexoh[1] != '') {
      _dialog(displayexoh[1]);
    }
    if (displayexoh[2] == displayexoh[5] &&
        displayexoh[2] == displayexoh[8] &&
        displayexoh[2] != '') {
      _dialog(displayexoh[2]);
    }
    if (displayexoh[0] == displayexoh[4] &&
        displayexoh[0] == displayexoh[8] &&
        displayexoh[0] != '') {
      _dialog(displayexoh[0]);
    }
    if (displayexoh[2] == displayexoh[4] &&
        displayexoh[2] == displayexoh[6] &&
        displayexoh[2] != '') {
      _dialog(displayexoh[2]);
    } else if (filledboxes == 9) {
      _showDialog();
    }
  }

  void _dialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Winner is :' + winner.toUpperCase()),
            actions: [
              OutlinedButton(
                onPressed: () {
                  _clearboard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "PlayAgain",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          );
        });
    if (winner == 'o') {
      ohscore += 1;
    } else if (winner == 'x') {
      exscore += 1;
    }
  }

  void _showDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Draw'),
            actions: [
              OutlinedButton(
                onPressed: () {
                  _clearboard();
                  Navigator.of(context).pop();
                },
                child: Text(
                  "PlayAgain",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          );
        });
  }

  void _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayexoh[i] = '';
      }
    });
    filledboxes = 0;
  }
}
