import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/widgets/winner.dart';


import '../widgets/play_box.dart';
import '../../utils/responsive.dart';
import '../../controller/game_controller.dart';

//class PlayScreen extends StatelessWidget {
class GameScreen extends StatefulWidget {

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  final GameController _gameController = GameController();
  bool _isWinnerModalOpen = false;

  void _addMark(int position) {
    setState(() {
      _gameController.addMark(position);
    });
    int winner = _gameController.checkWinner();
    if(winner != 0) {
      _isWinnerModalOpen = true;
      _showWinner(winner.toString());
    }
  }

  void _restart() {
    _isWinnerModalOpen = false;
    setState(() {
      _gameController.restart();
    });
  }

  void _showWinner(String winner) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        elevation: 12,
        shadowColor: Colors.black,
        backgroundColor: const Color(0xFFEADDFF),
        content: Winner(winner),
      )
    ).then((val){
      _restart();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color(0xFFD0BCFF),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Responsive.distancePercentFromHeight(context, 17.9372),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container (
                    alignment: Alignment.center,
                    height: Responsive.distancePercentFromHeight(context, 4.4843),
                    width: Responsive.distancePercentFromWidth(context, 34.9515),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: (_gameController.currentPlayer == 1)? const Color(0xFFFFFCF3) : const Color(0xFFe3e2cb),
                      
                    ),
                    child: Text('Jugador 1 O', style: TextStyle(
                      color: const Color(0xFF6750A4),
                      fontSize: Responsive.distancePercentText(context, 1.7937),
                      fontWeight: FontWeight.w500
                    )),
                  ),
                  SizedBox( 
                    width: Responsive.distancePercentFromWidth(context, 4.8544),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: Responsive.distancePercentFromHeight(context, 4.4843),
                    width: Responsive.distancePercentFromWidth(context, 34.9515),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20)
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      color: (_gameController.currentPlayer == 2)? const Color(0xFFFFFCF3) : const Color(0xFFe3e2cb),
                      
                    ),
                    child: Text('Jugador 2 X', style: TextStyle(
                      color: const Color(0xFF6750A4),
                      fontSize: Responsive.distancePercentText(context, 1.7937),
                      fontWeight: FontWeight.w500
                    )),
                  ),
                ],
              ),
            SizedBox(
              height: Responsive.distancePercentFromHeight(context, 4.9327),
            ),
            if(!_isWinnerModalOpen) ... [
              (!_gameController.gameStarted)
              ? Text('Inicia la partida', style: TextStyle(
                  fontSize: Responsive.distancePercentText(context, 2.6906)
                ))
              : InkWell(
                  onTap: () {
                    _restart();
                  },
                  child: Text('Reiniciar', style: TextStyle(
                    fontSize: Responsive.distancePercentText(context, 2.6906)
                  )),
              ),
              SizedBox(
                height: Responsive.distancePercentFromHeight(context, 6.2780),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _addMark(1);
                    },
                    child: PlayBox(_gameController.boxPlayer(1), false, true, true, false)
                  ),
                  InkWell(
                    onTap: () {
                      _addMark(2);
                    },
                    child: PlayBox(_gameController.boxPlayer(2), false, true, true, true)
                  ),
                  InkWell(
                    onTap: () {
                      _addMark(3);
                    },
                    child: PlayBox(_gameController.boxPlayer(3), false, false, true, true)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _addMark(4);
                    },
                    child: PlayBox(_gameController.boxPlayer(4), true, true, true, false)
                  ),
                  InkWell(
                    onTap: () {
                      _addMark(5);
                    },
                    child: PlayBox(_gameController.boxPlayer(5), true, true, true, true)
                  ),
                  InkWell(
                    onTap: () {
                      _addMark(6);
                    },
                    child: PlayBox(_gameController.boxPlayer(6), true, false, true, true)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _addMark(7);
                      },
                      child: PlayBox(_gameController.boxPlayer(7), true, true, false, false)
                    ),
                    InkWell(
                      onTap: () {
                        _addMark(8);
                      },
                      child: PlayBox(_gameController.boxPlayer(8), true, true, false, true)
                    ),
                    InkWell(
                      onTap: () {
                        _addMark(9);
                      },
                      child: PlayBox(_gameController.boxPlayer(9), true, false, false, true)
                    ),
                  ]
                ),
            ],
            const Expanded(child: SizedBox.shrink()),
            Image(
              image: const AssetImage('assets/images/pragma-aleteo.png'), 
              height: Responsive.distancePercentFromHeight(context, 5.9417),
              width: Responsive.distancePercentFromWidth(context, 83.4951),
            ),
            SizedBox(
              height: Responsive.distancePercentFromHeight(context, 3.1390),
            ),
          ],
        ),
      ),        
    );
  }
}