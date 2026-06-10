import 'package:booksale/domain/repositories/card_repository.dart';

class DeleteCardUseCase {
  final CardRepository repository;

  DeleteCardUseCase({required this.repository});

  Future<void> call(String cardId) async {
    return await repository.deleteCard(cardId);
  }
}