import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/presentation/screens/login/bloc/login_state.dart';

part 'login_event.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final UserRepository userRepository;
//
//   LoginBloc({required this.userRepository})
//       : super(const LoginState.initial()) {
//     on<LoginRequested>(_onLoginRequested);
//   }
//
//   void _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
//     emit(const LoginState.loading());
//     try {
//       final user = await userRepository.login(event.email, event.password);
//       // print(user);
//       emit(LoginState.success(user));
//     } catch (error) {
//       emit(const LoginState.failure("Login failed. Please try again."));
//     }
//   }
// }

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository})
      : super(const LoginState(status: LoadingStatus.initial)) {
    on<LoginRequested>(_onLoginRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(const LoginState(status: LoadingStatus.loading));
    try {
      final user = await userRepository.login(event.email, event.password);
      emit(LoginState(status: LoadingStatus.success, user: user));
    } catch (error) {
      emit(const LoginState(
          status: LoadingStatus.success,
          errorMessage: "Login failed. Please try again."));
    }
  }
}
