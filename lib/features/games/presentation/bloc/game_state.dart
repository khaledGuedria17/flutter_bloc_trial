import 'package:app/features/games/data/models/game.dart';

abstract class GameState {}

class GamesInitial extends GameState {}

class LoadingGames extends GameState {}

class LoadedGames extends GameState {
  //att
  final List<Game> games;
  //constructor
  LoadedGames(this.games);
}

class ErrorLoadingGames extends GameState {
  //att
  final String message;
  //constructor
  ErrorLoadingGames(this.message);
}
