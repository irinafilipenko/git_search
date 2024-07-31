import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/locator_service.dart' as di;

import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';
import 'package:git_search/presentation/screens/login/login_screen.dart';

import 'package:git_search/presentation/screens/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(MyApp());
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
          create: (context) => di.sl<LoginBloc>(),
          // LoginBloc(userRepository: userRepository),
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
