import 'package:app/features/games/data/repositories/game_repository.dart';
import 'package:app/features/games/presentation/bloc/game_event.dart';
import 'package:app/features/games/presentation/bloc/game_state.dart';
import 'package:bloc/bloc.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  //att
  final GameRepository gameRepository;

  //constructor
  GameBloc(this.gameRepository) : super(GamesInitial()) {
    on<LoadGames>((event, emit) async {
      emit(LoadingGames());

      try {
        final games = await gameRepository.fetchGames();
        emit(LoadedGames(games));
      } catch (e) {
        emit(ErrorLoadingGames(e.toString()));
      }
    });
  }
}
