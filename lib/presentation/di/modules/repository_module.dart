import 'package:git_search/data/repositories/home_repository.dart';
import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/data/service/services.dart';
import 'package:git_search/presentation/di/modules/module.dart';

import '../../../main.dart';

class RepositoryModule implements Module {
  @override
  void dependency() {
    // sl.registerLazySingleton<LocalDataStorage>(() => LocalDataStorageImpl());
    sl.registerSingletonAsync<LocalDataStorage>(
      () async {
        return LocalDataStorageImpl();
      },
    );
    sl.registerSingletonAsync<UserRepository>(
      () async {
        await sl.isReady<LocalDataStorage>();
        return UserRepository(sl<LoginService>(), sl<LocalDataStorage>());
      },
    );
    sl.registerSingletonAsync<HomeRepository>(
      () async {
        return HomeRepository(
          sl<HomeService>(),
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
