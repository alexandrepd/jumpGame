part of 'game_cubit.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {
  double verticalPosition;
  double horizontalPosition;
}
