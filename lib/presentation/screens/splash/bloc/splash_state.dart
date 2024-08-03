// part of 'splash_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/models/login_model.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    LoginModel? user,
    String? errorMessage,
  }) = _SplashState;
}
