part of 'main_bloc.dart';

abstract class MainEvent {}

class MainRequestedEvent extends MainEvent {
  final String searchText;

  MainRequestedEvent({
    required this.searchText,
  });
}

class ChangeSearchTextEvent extends MainEvent {
  final String searchText;

  ChangeSearchTextEvent({required this.searchText});
}
