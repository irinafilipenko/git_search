import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/repositories/home_repository.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/screens/home/bloc/home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;

  HomeBloc({required this.homeRepository}) : super(const HomeState()) {
    on<HomeRequestedEvent>(_onHomeRequested);
    on<ChangeSearchTextEvent>(_onChangeSearchText);
  }

  void _onChangeSearchText(
      ChangeSearchTextEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(searchText: event.searchText));
  }

  void _onHomeRequested(
      HomeRequestedEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final repositoryList =
          await homeRepository.getRepository(event.searchText);
      // Save user to cache
      // await userRepository.saveUserToCache(user);

      emit(state.copyWith(
          status: LoadingStatus.success, repositoryList: repositoryList));
    } catch (error) {
      emit(state.copyWith(
        status: LoadingStatus.failure,
        errorMessage: AppStrings.errorHomeText,
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
