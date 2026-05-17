import 'package:app/features/games/presentation/bloc/game_bloc.dart';
import 'package:app/features/games/presentation/bloc/game_state.dart';
import 'package:app/features/games/presentation/widgets/game_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Available Games")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            if (state is LoadingGames) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is LoadedGames) {
              return ListView.builder(
                itemCount: state.games.length,
                itemBuilder: (context, index) {
                  return GameCard(state.games[index]);
                },
              );
            }

            if (state is ErrorLoadingGames) {
              return Center(child: Text(state.message));
            }

            return Container(child: Text("N/A"));
          },
        ),
      ),
    );
  }
}
