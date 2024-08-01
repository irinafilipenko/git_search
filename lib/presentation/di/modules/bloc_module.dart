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
