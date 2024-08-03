import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:git_search/presentation/screens/favorite/favorite_screen.dart';
import 'package:git_search/presentation/screens/main/main_screen.dart';
import 'package:git_search/data/service/bindings.dart';
import 'package:git_search/presentation/screens/splash/splash_screen.dart';

class AppScreen {
  static final routes = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      // binding: Binding(),
    ),
    GetPage(
      name: MainScreen.routeName,
      page: () => const MainScreen(),
      binding: Binding(),
    ),
    GetPage(
      name: FavoriteScreen.routeName,
      page: () => const FavoriteScreen(),
      binding: Binding(),
    ),
  ];
}
