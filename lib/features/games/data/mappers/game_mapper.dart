import 'package:app/features/games/data/dto/game_dto.dart';
import 'package:app/features/games/data/models/game.dart';

class GameMapper {
  static Game map(GameDto dto) {
    return Game(
      dto.id,
      dto.name,
      dto.genre,
      dto.backgroundImage,
      dto.released,
      dto.rating,
    );
  }
}
