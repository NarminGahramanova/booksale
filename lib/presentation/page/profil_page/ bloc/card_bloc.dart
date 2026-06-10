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
      emit(CardsLoading());
      final cards = await getCardsUseCase();
      emit(CardsLoaded(cards: cards));
    } catch (e) {
      emit(CardsError(e.toString()));
    }
  }

  Future<void> _onAddCard(AddCard event, Emitter<CardState> emit) async {
    try {
      await addCardUseCase(event.newCard);

      if (state is CardsLoaded) {
        final currentCards = (state as CardsLoaded).cards;
        final updatedCards = [...currentCards, event.newCard];
        emit(CardsLoaded(cards: updatedCards));
      }
    } catch (e) {
      emit(CardsError(e.toString()));
    }
  }

  Future<void> _onDeletedCard(DeletedCard event, Emitter<CardState> emit) async {
    try {
      await deleteCardUseCase(event.cardId);

      if (state is CardsLoaded) {
        final currentCards = (state as CardsLoaded).cards;
        final updatedCards = currentCards
            .where((card) => card.id != event.cardId)
            .toList();
        emit(CardsLoaded(cards: updatedCards));
      }
    } catch (e) {
      emit(CardsError(e.toString()));
    }
  }
}