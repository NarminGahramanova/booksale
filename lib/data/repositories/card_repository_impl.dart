import 'package:booksale/data/datasources/card_remote_datasource.dart';
import 'package:booksale/domain/entities/card_entity.dart';
import 'package:booksale/domain/repositories/card_repository.dart';
import 'package:booksale/data/models/card_model.dart';

class CardRepositoryImpl implements CardRepository {
  final CardRemoteDataSource remoteDataSource;

  CardRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CardEntity>> getCards() async {
    final models = await remoteDataSource.getCards();
    return models.map((model) => _modelToEntity(model)).toList();
  }

  @override
  Future<void> addCard(CardEntity card) async {
    final model = _entityToModel(card);
    await remoteDataSource.addCard(model);
  }

  @override
  Future<void> deleteCard(String cardId) async {
    await remoteDataSource.deleteCard(cardId);
  }

  CardEntity _modelToEntity(CardModel model) {
    return CardEntity(
      id: model.id,
      cardNumber: model.cardNumber,
      cardHolder: model.cardHolder,
      expiryDate: model.expiryDate,
      cardType: model.cardType,
      isDefault: model.isDefault,
    );
  }

  CardModel _entityToModel(CardEntity entity) {
    return CardModel(
      id: entity.id,
      cardNumber: entity.cardNumber,
      cardHolder: entity.cardHolder,
      expiryDate: entity.expiryDate,
      cardType: entity.cardType,
      isDefault: entity.isDefault,
    );
  }
}