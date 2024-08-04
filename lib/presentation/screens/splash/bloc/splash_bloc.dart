import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_state.dart';

part 'splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final LocalDataStorage localDataStorage;

  SplashBloc({required this.localDataStorage}) : super(const SplashState()) {
    on<CheckUserStatusEvent>(_onCheckUserStatus);
  }

  Future<void> _onCheckUserStatus(
      CheckUserStatusEvent event, Emitter<SplashState> emit) async {
    // print("onCheckUserStatus");
    try {
      final user = await localDataStorage.getUserFromCache();
      emit(state.copyWith(status: LoadingStatus.success, user: user));
    } catch (error) {
      emit(state.copyWith(
          status: LoadingStatus.failure,
          errorMessage: AppStrings.errorSplashText));
    }
  }
}
