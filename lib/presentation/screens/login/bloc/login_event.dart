part of 'login_bloc.dart';

abstract class LoginEvent {}

class ChangeEmailEvent extends LoginEvent {
  final String email;

  ChangeEmailEvent({required this.email});
}

class ChangePasswordEvent extends LoginEvent {
  final String password;

  ChangePasswordEvent({required this.password});
}

class ResetFieldsEvent extends LoginEvent {
  final bool isEmailValid;
  final bool isPasswordlValid;

  ResetFieldsEvent(
      {required this.isEmailValid, required this.isPasswordlValid});
}

class LoginRequestedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginRequestedEvent({required this.email, required this.password});
}
