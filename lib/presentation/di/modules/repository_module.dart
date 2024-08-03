import 'package:git_search/data/repositories/main_repository.dart';
import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/data/service/services.dart';
import 'package:git_search/presentation/di/modules/module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class RepositoryModule implements Module {
  @override
  void dependency() {
    sl.registerSingletonAsync<LocalDataStorage>(
      () async {
        final sharedPreferences = await SharedPreferences.getInstance();
        return LocalDataStorageImpl(sharedPreferences: sharedPreferences);
      },
    );
    sl.registerSingletonAsync<UserRepository>(
      () async {
        await sl.isReady<LocalDataStorage>();
        return UserRepository(sl<LoginService>(), sl<LocalDataStorage>());
      },
    );
    sl.registerSingletonAsync<MainRepository>(
      () async {
        return MainRepository(
          sl<MainService>(),
        );
      },
    );
  }
}

// class RepositoryModule implements Module {
//   @override
//   Future<void> dependency() async {
//     sl.registerSingletonAsync<SharedPreferences>(
//       () async => await SharedPreferences.getInstance(),
//       signalsReady: true,
//     );
//
//     sl.registerSingletonAsync<LocalDataStorage>(
//       () async {
//         final sharedPreferences = await sl.getAsync<SharedPreferences>();
//         return LocalDataStorageImpl(sharedPreferences: sharedPreferences);
//       },
//       dependsOn: [SharedPreferences],
//       signalsReady: true,
//     );
//
//     sl.registerSingletonAsync<UserRepository>(
//       () async {
//         await sl.isReady<LocalDataStorage>();
//         return UserRepository(sl<LoginService>(), sl<LocalDataStorage>());
//       },
//       dependsOn: [LocalDataStorage],
//       signalsReady: true,
//     );
//   }
// }
