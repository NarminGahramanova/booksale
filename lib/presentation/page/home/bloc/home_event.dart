part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}
final class LoadBooks extends HomeEvent{}
final class CategorySelected extends HomeEvent{
  final int index;
   CategorySelected(this.index);


}
final class SearchBooks extends HomeEvent{
  final String query;
  SearchBooks(this.query);
}

