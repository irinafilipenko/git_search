import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/data/service/login_service.dart';
import 'package:git_search/presentation/di/modules/module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class RepositoryModule implements Module {
  @override
  void dependency() {
    sl.registerLazySingleton<LocalDataStorage>(
        () => LocalDataStorageImpl(sharedPreferences: sl<SharedPreferences>()));
    sl.registerLazySingleton<UserRepository>(
        () => UserRepository(sl<LoginService>(), sl<LocalDataStorage>()));
  }
}
