part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeRequestedEvent extends HomeEvent {
  final String searchText;

  HomeRequestedEvent({
    required this.searchText,
  });
}

class ChangeSearchTextEvent extends HomeEvent {
  final String searchText;

  ChangeSearchTextEvent({required this.searchText});
}

class ToggleFavoriteEvent extends HomeEvent {
  final int index;

  ToggleFavoriteEvent({required this.index});
}
