import 'package:booksale/domain/repositories/card_repository.dart';

import '../../core/utils/result.dart';

class DeleteCardUseCase {
  final CardRepository repository;

  DeleteCardUseCase({required this.repository});

  Future<Result<void>>call(String cardId) async {
    return await repository.deleteCard(cardId);
  }
}