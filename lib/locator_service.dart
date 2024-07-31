import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/data/service/login_service.dart';
import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';

final sl = GetIt.instance;

init() {
  sl.registerLazySingleton<UserRepository>(() => UserRepository());
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerFactory(() => LoginBloc(userRepository: sl<UserRepository>()));
  sl.registerLazySingleton<LoginService>(
    () => LoginService(sl<Dio>()),
  );
}
