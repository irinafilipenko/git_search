import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/screens/favorite/bloc/favorite_state.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/home_model.dart';

part 'favorite_event.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final LocalDataStorage localDataStorage;
  FavoriteBloc({required this.localDataStorage}) : super(FavoriteState()) {
    on<FavoriteLocalRequestedEvent>(_onFavoriteLocalRequested);
    on<DeleteFavoriteEvent>(_onDeleteFavorite);
  }

  void _onFavoriteLocalRequested(
      FavoriteLocalRequestedEvent event, Emitter<FavoriteState> emit) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final favoriteList =
          await localDataStorage.getFavoriteRepositoriesFromCache();

      emit(state.copyWith(
          status: LoadingStatus.success, favoriteList: favoriteList));
    } catch (error) {
      print(error);
      emit(state.copyWith(
        status: LoadingStatus.failure,
        errorMessage: AppStrings.errorHomeText,
      ));
    }
  }

  void _onDeleteFavorite(
      DeleteFavoriteEvent event, Emitter<FavoriteState> emit) async {
    final updatedList = List<HomeModel>.from(state.favoriteList!);
    updatedList.removeAt(event.index);

    emit(state.copyWith(favoriteList: updatedList));

    await localDataStorage.deleteRepositoriesToCache(updatedList);
  }
}
