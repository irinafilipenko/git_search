import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:git_search/data/repositories/user_repository.dart';
import 'package:git_search/presentation/di/injector.dart';
import 'package:git_search/presentation/di/modules/api_module.dart';
import 'package:git_search/presentation/di/modules/repository_module.dart';

import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';
import 'package:git_search/presentation/screens/login/login_screen.dart';

import 'package:git_search/presentation/screens/main/main_screen.dart';

final sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.instance.inject([ApiModule(), RepositoryModule()]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(userRepository: sl<UserRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Photo App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/main': (context) => const MainScreen(),
        },
      ),
    );
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initServices();
//
//   runApp(const MyApp());
// }
//
// Future<void> initServices() async {
//   await Get.putAsync<GetStorageService>(
//       () async => await GetStorageService().init());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'git_search',
//       initialRoute: MainScreen.routeName,
//       getPages: AppScreen.routes,
//       useInheritedMediaQuery: true,
//     );
//   }
// }
