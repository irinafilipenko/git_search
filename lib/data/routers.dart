import 'package:flutter/material.dart';
import 'package:git_search/presentation/screens/favorite/favorite_screen.dart';
import 'package:git_search/presentation/screens/home/home_screen.dart';
import 'package:git_search/presentation/screens/login/login_screen.dart';
import 'package:git_search/presentation/screens/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: <RouteBase>[
    GoRoute(
      path: '/splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/favorite',
      builder: (BuildContext context, GoRouterState state) {
        return const FavoriteScreen();
      },
    ),
  ],
);
