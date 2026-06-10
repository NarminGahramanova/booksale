
import 'package:booksale/domain/entities/card_entity.dart';

abstract class CardRepository {
  Future<List<CardEntity>> getCards();
  Future<void> addCard(CardEntity card);
  Future<void> deleteCard(String cardId);
}