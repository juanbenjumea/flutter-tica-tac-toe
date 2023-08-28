import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class Winner extends StatelessWidget {

  final String winnerNumber;

  const Winner( this.winnerNumber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image(
              image: const AssetImage('assets/images/player-icon.png'), 
              height: Responsive.distancePercentFromHeight(context, 8.7378),
              width: Responsive.distancePercentFromWidth(context, 8.7378),
            ),
            Text('Ganador\nJugador $winnerNumber', style: TextStyle(
              fontSize: Responsive.distancePercentText(context, 4.3901),
              color: const Color(0xff21005D),
            ))
          ],
        );
  }
}