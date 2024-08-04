import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/models/home_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    HomeResponse? repositoryList,
    String? searchText,
    String? errorMessage,
  }) = _HomeState;
}
