import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';

import 'package:git_search/presentation/screens/login/components/login_body.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_state.dart';

import '../../../main.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          print(state.user);
          if (state.status == LoadingStatus.success && state.user != null) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacementNamed(context, '/main');
            });
          } else if (state.status == LoadingStatus.failure) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.pushReplacementNamed(context, '/login');
            });
          }
        },
        child: Image.asset(
          'assets/images/loading_splash.png',
        ),
      ),
    );
  }
}
