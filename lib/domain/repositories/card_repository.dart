
import 'package:booksale/core/utils/result.dart';
import 'package:booksale/domain/entities/card_entity.dart';

abstract class CardRepository {
  Future<Result<List<CardEntity>>> getCards();
  Future<Result<void>> addCard(CardEntity card);
  Future<Result<void>>deleteCard(String cardId);
}