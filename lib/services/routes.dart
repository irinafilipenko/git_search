import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:git_search/screens/favorite/favorite_screen.dart';
import 'package:git_search/services/bindings.dart';
import '../screens/main/main_screen.dart';

class AppScreen {
  static final routes = [
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
