import 'package:bloc/bloc.dart';
import 'package:booksale/domain/entities/book.dart';
import 'package:booksale/data/repositories/book_repository_impl.dart';
import 'package:meta/meta.dart';
import '../../../../core/utils/mock_data.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = BookRepositoryImpl();

  HomeBloc() : super(HomeInitial()) {
    on<LoadBooks>(_onLoadBooks);
    on<CategorySelected>(_onCategorySelected);
    on<SearchBooks>(_onSearchBooks);
  }

  final List<String> _categories = [
    'Hamısı',
    'Roman',
    'Klassik',
    'Hekayə',
    'Dram',
    'Şeir',
    'Elmi',
    'Qeyri-bədii',
    'Uşaq',
  ];

  Future<void> _onLoadBooks(LoadBooks event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      List<Book> books;
      try {
        books = await _repository.getAllBooks();
        if (books.isEmpty) books = mockBooks;
      } catch (e) {
        print('API xətası: $e');
        books = mockBooks;
      }

      emit(
        HomeLoaded(
          categories: _categories,
          allBooks: books,
          filteredBooks: books,
          selectedIndex: 0,
        ),
      );
    } catch (e) {
      print('HomeBloc xətası: $e');
      emit(HomeError(message: e.toString()));
    }
  }

  void _onCategorySelected(CategorySelected event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final current = state as HomeLoaded;
      final filtered = event.index == 0
          ? current.allBooks
          : current.allBooks
                .where((b) => b.category == _categories[event.index])
                .toList();
      emit(
        current.copyWith(selectedIndex: event.index, filteredBooks: filtered),
      );
    }
  }

  void _onSearchBooks(SearchBooks event, Emitter<HomeState> emit) {
    if (state is HomeLoaded) {
      final current = state as HomeLoaded;
      final filtered = event.query.isEmpty
          ? current.allBooks
          : current.allBooks
                .where(
                  (b) =>
                      b.title.toLowerCase().contains(event.query.toLowerCase()),
                )
                .toList();
      emit(current.copyWith(filteredBooks: filtered));
    }
  }
}
