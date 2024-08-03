import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/presentation/di/modules/module.dart';
import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';

import '../../../main.dart';

class BlocModule implements Module {
  @override
  void dependency() {
    sl.registerFactory(() => LoginBloc(userRepository: sl<UserRepository>()));
  }
}
// class BlocModule implements Module {
//   @override
//   Future<void> dependency() async {
//     await sl.isReady<UserRepository>();
//     sl.registerFactory(() => LoginBloc(userRepository: sl<UserRepository>()));
//   }
// }
