part of 'add_bloc.dart';

@immutable
sealed class AddEvent {}
final class PickFromCamera extends AddEvent{}
final class PickFromGallery extends AddEvent{}

