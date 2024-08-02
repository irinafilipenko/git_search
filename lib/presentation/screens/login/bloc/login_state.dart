import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/models/login_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    LoginModel? user,
    String? errorMessage,
    String? email,
    String? password,
    @Default(true) bool isPasswordValid,
    @Default(true) bool isEmailValid,
  }) = _LoginState;
}
