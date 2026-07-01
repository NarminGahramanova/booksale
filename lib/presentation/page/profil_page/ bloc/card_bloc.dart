import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:booksale/domain/usecases/get_cards_usecase.dart';
import 'package:booksale/domain/usecases/add_card_usecase.dart';
import 'package:booksale/domain/usecases/delete_card_usecase.dart';
import 'package:booksale/domain/entities/card_entity.dart';

part 'card_event.dart';

part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final GetCardsUseCase getCardsUseCase;
  final AddCardUseCase addCardUseCase;
  final DeleteCardUseCase deleteCardUseCase;

  CardBloc({
    required this.getCardsUseCase,
    required this.addCardUseCase,
    required this.deleteCardUseCase,
  }) : super(CardInitial()) {
    on<LoadCards>(_onLoadCards);
    on<AddCard>(_onAddCard);
    on<DeletedCard>(_onDeletedCard);
  }

  Future<void> _onLoadCards(LoadCards event, Emitter<CardState> emit) async {
    try {
      emit(CardLoading());
      final cards = await getCardsUseCase();
      emit(CardLoaded(cards: cards));
    } catch (e) {
      emit(CardError(e.toString()));
    }
  }

  Future<void> _onAddCard(AddCard event, Emitter<CardState> emit) async {
    final currentCards = state is CardLoaded
        ? (state as CardLoaded).cards
        : <CardEntity>[];

    emit(CardLoaded(cards: [...currentCards, event.newCard]));

    try {
      await addCardUseCase(event.newCard);
    } catch (e) {emit(CardError(e.toString()));}
  }

  Future<void> _onDeletedCard(
    DeletedCard event,
    Emitter<CardState> emit,
  ) async {
    if (state is CardLoaded) {
      final currentCards = (state as CardLoaded).cards;


      final updatedCards = currentCards
          .where((card) => card.id != event.cardId)
          .toList();
      emit(CardLoaded(cards: updatedCards));
    }
  }
}
