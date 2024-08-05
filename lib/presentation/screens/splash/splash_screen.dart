import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/main.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:git_search/presentation/screens/splash/components/splash_body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SplashBloc>(),
      child: const Scaffold(
        body: SplashBody(),
      ),
    );
  }
}
