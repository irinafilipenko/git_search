import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_search/screens/main/main_screen.dart';
import 'package:git_search/services/routes.dart';
import 'services/get_storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();

  runApp(const MyApp());
}

Future<void> initServices() async {
  await Get.putAsync<GetStorageService>(
      () async => await GetStorageService().init());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'git_search',
      initialRoute: MainScreen.routeName,
      getPages: AppScreen.routes,
      useInheritedMediaQuery: true,
    );
  }
}
