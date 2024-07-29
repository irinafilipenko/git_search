part of 'login_bloc.dart';

// @immutable
// abstract class LoginEvent extends Equatable {
//   @override
//   List<Object> get props => [];
// }
//
// class FetchLogin extends LoginEvent {}

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends LoginEvent {
  final String email;
  final String password;

  const LoginRequested({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
