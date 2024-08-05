part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteLocalRequestedEvent extends FavoriteEvent {
  FavoriteLocalRequestedEvent();
}

class DeleteFavoriteEvent extends FavoriteEvent {
  final int index;

  DeleteFavoriteEvent({required this.index});
}
