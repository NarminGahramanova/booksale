part of 'card_bloc.dart';

@immutable
sealed class CardEvent {}

final class LoadCards extends CardEvent {}

final class AddCard extends CardEvent {
  final CardEntity newCard;
  AddCard(this.newCard);
}

final class DeletedCard extends CardEvent {
  final String cardId;
  DeletedCard({required this.cardId});
}