import '../../model/board_model.dart';

class GameController {

  int _taps = 0;
  int _currentPlayer = 1;
  bool _gameStarted = false;

  Map<int, String> _boxPlayer = {
    1: 'noPlayer',
    2: 'noPlayer',
    3: 'noPlayer',
    4: 'noPlayer',
    5: 'noPlayer',
    6: 'noPlayer',
    7: 'noPlayer',
    8: 'noPlayer',
    9: 'noPlayer',
  };

  final _winningCombination = BoardModel.winningCombination;

  void addMark(int position) {
    _gameStarted = true;
    if(_boxPlayer[position] == 'noPlayer') {
        _taps++;
        _boxPlayer[position] = "player$_currentPlayer";
        _currentPlayer = (_currentPlayer == 1)? 2 : 1;
    }
  }

  int checkWinner() {
    if(_taps > 4) {
      for(int i = 0; i < _winningCombination.length; i++) {
        int position1 = _winningCombination[i][0];
        int position2 = _winningCombination[i][1];
        int position3 = _winningCombination[i][2];
        if(_boxPlayer[position1] != 'noPlayer' 
            && _boxPlayer[position1] == _boxPlayer[position2]
            && _boxPlayer[position1] == _boxPlayer[position3]){
          String winner = _boxPlayer[position1]!.substring(6);
          return int.parse(winner);
        }
      }
    }
    return 0;
  }
  
  void restart() {
    _gameStarted = false;
    _taps = 0;
    _currentPlayer = 1;
    _boxPlayer = {
      1: 'noPlayer',
      2: 'noPlayer',
      3: 'noPlayer',
      4: 'noPlayer',
      5: 'noPlayer',
      6: 'noPlayer',
      7: 'noPlayer',
      8: 'noPlayer',
      9: 'noPlayer',
    };
  }

  String? boxPlayer(int position) {
    return _boxPlayer[position];
  }
  
  bool get gameStarted {
    return _gameStarted;
  }

  int get currentPlayer {
    return _currentPlayer;
  }

}