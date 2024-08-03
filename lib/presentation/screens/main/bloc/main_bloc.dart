import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/repositories/main_repository.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/screens/main/bloc/main_state.dart';

part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository mainRepository;

  MainBloc({required this.mainRepository}) : super(const MainState()) {
    on<MainRequestedEvent>(_onMainRequested);
    on<ChangeSearchTextEvent>(_onChangeSearchText);
  }

  void _onChangeSearchText(
      ChangeSearchTextEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(searchText: event.searchText));
  }

  void _onMainRequested(
      MainRequestedEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final repositoryList =
          await mainRepository.getRepository(event.searchText);
      // Save user to cache
      // await userRepository.saveUserToCache(user);

      emit(state.copyWith(
          status: LoadingStatus.success, repositoryList: repositoryList));
    } catch (error) {
      emit(state.copyWith(
        status: LoadingStatus.failure,
        errorMessage: AppStrings.errorMainText,
      ));
    }
  }

  // bool _validateEmail(String email) {
  //   final emailRegex = RegExp(
  //       r"^[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]{1,10}@(?:(?!.*--)[a-zA-Z0-9-]{1,10}(?<!-))(?:\.(?:[a-zA-Z0-9-]{2,10}))+");
  //   return email.length >= 6 &&
  //       email.length <= 30 &&
  //       emailRegex.hasMatch(email);
  // }
  //
  // bool _validatePassword(String password) {
  //   final passwordRegex =
  //   RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,10}$');
  //   return password.length >= 6 &&
  //       password.length <= 10 &&
  //       passwordRegex.hasMatch(password);
  // }
}
