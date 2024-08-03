import 'package:git_search/presentation/di/modules/module.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class SharedPreferencesModule implements Module {
  @override
  void dependency() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
