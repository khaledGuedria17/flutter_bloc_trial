import 'package:app/features/games/data/models/game.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  //att
  final Game currentGame;
  GameCard(this.currentGame, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          //1
          Image.network(currentGame.image),
          Text(currentGame.name),
          Text(currentGame.release),
          Text(currentGame.type),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentGame.rating.toString()),
              Icon(Icons.star_border),
            ],
          ),
        ],
      ),
    );
  }
}
