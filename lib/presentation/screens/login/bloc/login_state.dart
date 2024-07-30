import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/models/login_model.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoadingStatus.initial) LoadingStatus status,
    @Default(LoginModel(avatarUrl: '', fullName: "", email: ""))
    LoginModel user,
    @Default('') String errorMessage,
  }) = _LoginState;
}
