import 'package:app/features/games/data/models/game.dart';

abstract class GameRepository {
  Future<List<Game>> fetchGames();
}
