import 'package:flutter/material.dart';

import '../../utils/responsive.dart';

class PlayBox extends StatefulWidget {

  final String? player;
  final bool top, right, bottom, left;

  const PlayBox(this.player, this.top, this.right, this.bottom, this.left, {super.key});
  
  @override
  State<PlayBox> createState() => _PlayBoxState();
}

class _PlayBoxState extends State<PlayBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: widget.top
            ? BorderSide(
              width: Responsive.distancePercentFromWidth(context, 0.7281),
              color: const Color(0xFF644381),
            )
            : BorderSide.none,
          right: widget.right
            ? BorderSide(
              width: Responsive.distancePercentFromWidth(context, 0.7281),
              color: const Color(0xFF644381),
            )
            : BorderSide.none,
          bottom: widget.bottom
            ? BorderSide(
              width: Responsive.distancePercentFromWidth(context, 0.7281),
              color: const Color(0xFF644381),
            )
            : BorderSide.none,
          left: widget.left
            ? BorderSide(
              width: Responsive.distancePercentFromWidth(context, 0.7281),
              color: const Color(0xFF644381),
            )
            : BorderSide.none,
        )
      ),
      width: Responsive.distancePercentFromWidth(context, 24.2718),
      height: Responsive.distancePercentFromHeight(context, 11.2108),
      child: Center(
        child:
          (widget.player == 'player1')
          ? Image(
              image: const AssetImage('assets/images/mark_o.png'), 
              height: Responsive.distancePercentFromHeight(context, 5.9417),
            )
          : (widget.player == 'player2')
            ? Image(
                image: const AssetImage('assets/images/mark_x.png'), 
                height: Responsive.distancePercentFromHeight(context, 5.9417),
              )
            : const Text(''),
      ),
    );
  }
}