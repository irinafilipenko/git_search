import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/models/home_model.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    List<HomeModel>? favoriteList,
    String? errorMessage,
  }) = _FavoriteState;
}
