import 'package:dio/dio.dart';
import 'package:booksale/data/models/card_model.dart';

abstract class CardRemoteDataSource {
  Future<List<CardModel>> getCards();
  Future<void> addCard(CardModel card);
  Future<void> deleteCard(String cardId);
}

class CardRemoteDataSourceImpl implements CardRemoteDataSource {
  final Dio dio;

  CardRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CardModel>> getCards() async {
    try {
      final response = await dio.get('/cards');
      return (response.data as List)
          .map((card) => CardModel.fromJson(card))
          .toList();
    } catch (e) {
      throw Exception('Failed to load cards');
    }
  }

  @override
  Future<void> addCard(CardModel card) async {
    try {
      await dio.post('/cards', data: card.toJson());
    } catch (e) {
      throw Exception('Failed to add card');
    }
  }

  @override
  Future<void> deleteCard(String cardId) async {
    try {
      await dio.delete('/cards/$cardId');
    } catch (e) {
      throw Exception('Failed to delete card');
    }
  }
}