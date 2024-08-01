import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/presentation/di/modules/module.dart';

import '../../../main.dart';

class RepositoryModule implements Module {
  @override
  dependency() {
    sl.registerLazySingleton<UserRepository>(() => UserRepository());
  }
}
