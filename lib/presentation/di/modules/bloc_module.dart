import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/presentation/di/modules/module.dart';
import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_bloc.dart';

import '../../../main.dart';

class BlocModule implements Module {
  @override
  void dependency() {
    sl.registerFactory(() => LoginBloc(userRepository: sl<UserRepository>()));
    sl.registerFactory(
        () => SplashBloc(localDataStorage: sl<LocalDataStorage>()));
  }
}
