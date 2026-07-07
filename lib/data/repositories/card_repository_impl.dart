import 'package:booksale/core/error/failures.dart';
import 'package:booksale/core/utils/result.dart';
import 'package:booksale/data/datasources/card_remote_datasource.dart';
import 'package:booksale/domain/entities/card_entity.dart';
import 'package:booksale/domain/repositories/card_repository.dart';
import 'package:booksale/data/models/card_model.dart';

class CardRepositoryImpl implements CardRepository {
  final CardRemoteDataSource remoteDataSource;

  CardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Result<List<CardEntity>>> getCards() async {
    try {
      final cards = await remoteDataSource.getCards();
      return Success(cards);
    } catch (e) {
      return Error(CacheFailure());
    }
  }

  @override
  Future<Result<void>> addCard(CardEntity card) async {
    try {
      final model = CardModel(
        id: card.id,
        cardNumber: card.cardNumber,
        cardHolder: card.cardHolder,
        expiryDate: card.expiryDate,
        cardType: card.cardType,
        isDefault: card.isDefault,
      );
      await remoteDataSource.addCard(model);
      return const Success(null);
    } catch (e) {
      return Error(CacheFailure());
    }
  }

  @override
  Future<Result<void>>deleteCard(String cardId) async {
    try {
      await remoteDataSource.deleteCard(cardId);
      return const Success(null);
    } catch (e) {
      return Error(CacheFailure());
    }
  }
}