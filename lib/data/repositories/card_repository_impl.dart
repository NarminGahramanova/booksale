import 'package:booksale/data/datasources/card_remote_datasource.dart';
import 'package:booksale/domain/entities/card_entity.dart';
import 'package:booksale/domain/repositories/card_repository.dart';
import 'package:booksale/data/models/card_model.dart';

class CardRepositoryImpl implements CardRepository {
  final CardRemoteDataSource remoteDataSource;

  CardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CardEntity>> getCards() async {
    return await remoteDataSource.getCards();
  }

  @override
  Future<void> addCard(CardEntity card) async {
    final model = CardModel(
      id: card.id,
      cardNumber: card.cardNumber,
      cardHolder: card.cardHolder,
      expiryDate: card.expiryDate,
      cardType: card.cardType,
      isDefault: card.isDefault,
    );
    await remoteDataSource.addCard(model);
  }

  @override
  Future<void> deleteCard(String cardId) async {
    await remoteDataSource.deleteCard(cardId);
  }
}