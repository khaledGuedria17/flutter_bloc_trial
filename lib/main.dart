import 'package:app/features/games/data/repositories/game_repository.dart';
import 'package:app/features/games/data/repositories/game_repository_impl.dart';
import 'package:app/features/games/data/services/game_service.dart';
import 'package:app/features/games/presentation/bloc/game_bloc.dart';
import 'package:app/features/games/presentation/bloc/game_event.dart';
import 'package:app/features/games/presentation/pages/games_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  http.Client client = http.Client();
  GameService gameService = GameService(client);
  GameRepository repository = GameRepositoryImpl(gameService);
  runApp(MyApp(repository));
}

class MyApp extends StatelessWidget {
  final GameRepository gameRepository;
  const MyApp(this.gameRepository, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => GameBloc(gameRepository)..add(LoadGames()),
        child: GamesPage(),
      ),
    );
  }
}
