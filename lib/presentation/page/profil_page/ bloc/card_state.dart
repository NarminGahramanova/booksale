part of 'card_bloc.dart';

@immutable
sealed class CardState {}

final class CardInitial extends CardState {}

final class CardLoading extends CardState {}

final class CardLoaded extends CardState {
  final List<CardEntity> cards;
  CardLoaded({required this.cards});
}

final class CardError extends CardState {
  final String message;
  CardError(this.message);
}