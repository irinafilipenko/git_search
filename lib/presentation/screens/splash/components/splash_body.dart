import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_state.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});
  @override
  SplashBodyState createState() => SplashBodyState();
}

class SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  void checkUserStatus() {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      context.read<SplashBloc>().add(CheckUserStatusEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state.status != LoadingStatus.success) {
          return;
        } else if (state.status == LoadingStatus.success &&
            state.user != null) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state.status == LoadingStatus.success &&
            state.user == null) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Image.asset(
        'assets/images/loading_splash.png',
      ),
    );
  }
}
