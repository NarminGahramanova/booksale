import 'package:booksale/domain/entities/card_entity.dart';
import 'package:booksale/domain/repositories/card_repository.dart';

class GetCardsUseCase {
  final CardRepository repository;

  GetCardsUseCase({required this.repository});

  Future<List<CardEntity>> call() async {
    return await repository.getCards();
  }
}