import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_state.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/';

  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print("init");
    checkUserStatus();
    super.initState();
  }

  void checkUserStatus() {
    Future.delayed(const Duration(seconds: 3), () {
      // context.read<SplashBloc>().add(CheckUserStatusEvent());
      final state = context.read<SplashBloc>().state;
      if (state.status == LoadingStatus.success && state.user != null) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (state.status == LoadingStatus.success && state.user == null) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {},
        child: Image.asset(
          'assets/images/loading_splash.png',
        ),
      ),
    );
  }
}
