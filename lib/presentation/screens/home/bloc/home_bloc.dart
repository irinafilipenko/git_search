import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/models/home_model.dart';
import 'package:git_search/data/repositories/home_repository.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/screens/home/bloc/home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(const HomeState()) {
    on<HomeRequestedEvent>(_onHomeRequested);
    on<ChangeSearchTextEvent>(_onChangeSearchText);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  void _onChangeSearchText(
      ChangeSearchTextEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(searchText: event.searchText));
  }

  void _onHomeRequested(
      HomeRequestedEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final repositoryList =
          await homeRepository.getRepository(event.searchText);
      // Save user to cache
      // await userRepository.saveUserToCache(user);

      emit(state.copyWith(
          status: LoadingStatus.success, repositoryList: repositoryList));
    } catch (error) {
      print(error);
      emit(state.copyWith(
        status: LoadingStatus.failure,
        errorMessage: AppStrings.errorHomeText,
      ));
    }
  }

  void _onToggleFavorite(ToggleFavoriteEvent event, Emitter<HomeState> emit) {
    final updatedModel = state.repositoryList![event.index].copyWith(
      isFavorite: !state.repositoryList![event.index].isFavorite,
    );

    final updatedList = List<HomeModel>.from(state.repositoryList!);
    updatedList[event.index] = updatedModel;

    emit(state.copyWith(repositoryList: updatedList));
  }
}
