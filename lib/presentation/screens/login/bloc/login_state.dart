import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/core/bloc_status.dart';
import 'package:git_search/data/models/login_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(BlocStatus.initial) BlocStatus status,
    @Default(LoginModel(avatarUrl: '', fullName: "", email: ""))
    LoginModel user,
    @Default('') String errorMessage,
  }) = _LoginState;

  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success(LoginModel user) = _Success;
  const factory LoginState.failure(String errorMessage) = _Failure;
}
