import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/data/service/login_service.dart';
import 'package:git_search/presentation/di/modules/module.dart';

import '../../../main.dart';

class RepositoryModule implements Module {
  @override
  void dependency() {
    sl.registerLazySingleton<UserRepository>(
        () => UserRepository(sl<LoginService>()));
  }
}
