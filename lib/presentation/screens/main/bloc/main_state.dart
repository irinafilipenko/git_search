import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/models/main_model.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    MainResponse? repositoryList,
    String? searchText,
    String? errorMessage,
  }) = _MainState;
}
