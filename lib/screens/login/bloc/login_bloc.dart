import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:git_search/core/bloc_status.dart';
import 'package:git_search/screens/login/login_model.dart';
import 'package:git_search/screens/login/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(const LoginState.initial());
// }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(LoginState.initial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginState.loading());
    try {
      final user = await userRepository.login(event.email, event.password);
      emit(LoginState.success(user as List<LoginModel>));
    } catch (error) {
      emit(const LoginState.failure("Login failed. Please try again."));
    }
  }
}
