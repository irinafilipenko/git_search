part of 'login_bloc.dart';

class LoginState extends Equatable {
  final BlocStatus status;
  final LoginModel user;
  final String errorMessage;

  const LoginState._({
    this.status = BlocStatus.initial,
    this.user = const LoginModel(avatarUrl: '', fullName: "", email: ""), //
    this.errorMessage = '',
  });

  const LoginState.initial() : this._();

  const LoginState.loading() : this._(status: BlocStatus.loading);

  const LoginState.success(LoginModel user)
      : this._(status: BlocStatus.success, user: user);

  const LoginState.failure(String errorMessage)
      : this._(status: BlocStatus.failure, errorMessage: errorMessage);

  @override
  List<Object> get props => [status, user, errorMessage];
}
