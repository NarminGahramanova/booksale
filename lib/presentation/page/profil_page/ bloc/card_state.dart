part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class CardsLoading extends CardState {}

final class CardsLoaded extends CardState {
  final List<CardEntity> cards;
  CardsLoaded({required this.cards});
}

final class CardsError extends CardState {
  final String message;
  CardsError(this.message);
}