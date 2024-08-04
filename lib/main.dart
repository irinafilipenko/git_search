import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:git_search/data/routers.dart';

import 'package:git_search/presentation/di/injector.dart';
import 'package:git_search/presentation/di/modules/service_module.dart';
import 'package:git_search/presentation/di/modules/bloc_module.dart';
import 'package:git_search/presentation/di/modules/repository_module.dart';

final sl = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Injector.instance.inject(
    [ServiceModule(), RepositoryModule(), BlocModule()],
  );

  await sl.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Git search',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      routerConfig: router,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/login': (context) => const LoginScreen(),
      //   '/home': (context) => const HomeScreen(),
      // },
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
