import 'package:bloc/bloc.dart';

import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/screens/login/bloc/login_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc({required this.userRepository}) : super(const LoginState()) {
    on<LoginRequestedEvent>(_onLoginRequested);
    on<ChangeEmailEvent>(_onChangeEmail);
    on<ChangePasswordEvent>(_onChangePassword);
    on<ResetFieldsEvent>(_onResetFields);
    on<ValidateEmailEvent>(_onValidateEmail);
    on<ValidatePasswordEvent>(_onValidatePassword);
  }

  void _onChangeEmail(ChangeEmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email, isEmailValid: true));
  }

  void _onChangePassword(ChangePasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password, isPasswordValid: true));
  }

  void _onValidateEmail(ValidateEmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isEmailValid: _validateEmail(event.email)));
  }

  void _onValidatePassword(
      ValidatePasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isPasswordValid: _validatePassword(event.password)));
  }

  void _onResetFields(ResetFieldsEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(
        isEmailValid: event.isEmailValid,
        isPasswordValid: event.isPasswordlValid));
  }

  void _onLoginRequested(
      LoginRequestedEvent event, Emitter<LoginState> emit) async {
    final isEmailValid = _validateEmail(event.email);
    final isPasswordValid = _validatePassword(event.password);

    if (!isEmailValid || !isPasswordValid) {
      emit(state.copyWith(
        status: LoadingStatus.failure,
        isEmailValid: isEmailValid,
        isPasswordValid: isPasswordValid,
        errorMessage: AppStrings.invalidText,
      ));
      return;
    }

    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final user = await userRepository.login(event.email, event.password);
      emit(state.copyWith(status: LoadingStatus.success, user: user));
    } catch (error) {
      emit(state.copyWith(
        status: LoadingStatus.failure,
        errorMessage: AppStrings.loginFailedText,
      ));
    }
  }

  bool _validateEmail(String email) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]{1,10}@(?:(?!.*--)[a-zA-Z0-9-]{1,10}(?<!-))(?:\.(?:[a-zA-Z0-9-]{2,10}))+");
    return email.length >= 6 &&
        email.length <= 30 &&
        emailRegex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    final passwordRegex =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,10}$');
    return password.length >= 6 &&
        password.length <= 10 &&
        passwordRegex.hasMatch(password);
  }
}
