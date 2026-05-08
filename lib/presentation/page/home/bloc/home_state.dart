part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<String> categories;
  final List<Book> allBooks;
  final List<Book> filteredBooks;
  final int selectedIndex;

  HomeLoaded({
    required this.categories,
    required this.allBooks,
    required this.filteredBooks,
    required this.selectedIndex,
  });

  HomeLoaded copyWith({
    int? selectedIndex,
    List<Book>? filteredBooks,
    List<Book>? allBooks,

  }) {
    return HomeLoaded(
      categories: categories,
      allBooks: allBooks??this.allBooks,
      filteredBooks: filteredBooks ?? this.filteredBooks,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

final class HomeError extends HomeState {
  final String message;
  HomeError({required this.message});
}