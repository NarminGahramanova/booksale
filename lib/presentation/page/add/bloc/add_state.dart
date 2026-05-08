part of 'add_bloc.dart';

@immutable
sealed class AddState {}

final class AddInitial extends AddState {}

final class ImageInitial extends AddState {}

final class ImageLoaded extends AddState {
  final List<String> images;
   ImageLoaded({required this.images});
}

final class ImageError extends AddState {
  final String message;
   ImageError({required this.message});
}