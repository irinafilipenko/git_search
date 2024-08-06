import 'package:flutter/material.dart';
import 'package:git_search/presentation/routes/app_routes_stings.dart';
import 'package:git_search/presentation/screens/favorite/favorite_screen.dart';
import 'package:git_search/presentation/screens/home/home_screen.dart';
import 'package:git_search/presentation/screens/login/login_screen.dart';
import 'package:git_search/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutesStings.splashPath,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutesStings.splashPath,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: AppRoutesStings.loginPath,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: AppRoutesStings.homePath,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: AppRoutesStings.favoritePath,
      builder: (BuildContext context, GoRouterState state) {
        return const FavoriteScreen();
      },
    ),
  ],
);
