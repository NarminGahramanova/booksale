import 'package:booksale/domain/entities/card_entity.dart';
import 'package:booksale/domain/repositories/card_repository.dart';

class AddCardUseCase {
  final CardRepository repository;

  AddCardUseCase({required this.repository});

  Future<void> call(CardEntity card) async {
    return await repository.addCard(card);
  }
}