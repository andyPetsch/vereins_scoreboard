// lib/screens/game_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/game_controller.dart';
import '../widgets/score_display.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameController = Provider.of<GameController>(context);
    final state = gameController.state;

    return Scaffold(
      body: Column(
        children: [
          // Score displays
          Expanded(
            child: Row(
              children: [
                ScoreDisplay(
                  playerIndex: 0,
                  isActive: state.activePlayer == 1,
                  isBreaking: state.breakingPlayer == 1,
                ),
                ScoreDisplay(
                  playerIndex: 1,
                  isActive: state.activePlayer == 2,
                  isBreaking: state.breakingPlayer == 2,
                ),
              ],
            ),
          ),

          // Bottom controls
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.undo),
                  label: Text('Undo'),
                  onPressed: gameController.stateHistory.isEmpty
                      ? null
                      : () => gameController.handleAction({'type': 'UNDO'}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showNewGameDialog(BuildContext context, GameController controller) {
    // Implement new game dialog
  }
}
