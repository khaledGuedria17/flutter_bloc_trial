import 'dart:convert';

import 'package:app/features/games/data/dto/game_dto.dart';
import 'package:app/features/games/data/mappers/game_mapper.dart';
import 'package:app/features/games/data/models/game.dart';
import 'package:app/features/games/data/repositories/game_repository.dart';
import 'package:app/features/games/data/services/game_service.dart';
import 'package:http/http.dart' as http;

class GameRepositoryImpl implements GameRepository {
  //att
  final GameService gameService;

  //constructor
  const GameRepositoryImpl(this.gameService);

  //actions
  @override
  Future<List<Game>> fetchGames() async {
    print("Repository : Hello");
    final List<Game> games = [];
    http.Response response = await gameService.getAll();
    List<dynamic> map = jsonDecode(response.body)["data"];
    for (var element in map) {
      games.add(GameMapper.map(GameDto.fromJson(element)));
    }
    print("Games = " + games.length.toString());
    return games;
  }
}
