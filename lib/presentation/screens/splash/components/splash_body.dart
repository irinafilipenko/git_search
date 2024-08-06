import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/routes/app_routes_stings.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_bloc.dart';
import 'package:git_search/presentation/screens/splash/bloc/splash_state.dart';
import 'package:go_router/go_router.dart';

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
          context.go(AppRoutesStings.homePath);
          // Navigator.pushReplacementNamed(context, '/home');
        } else if (state.status == LoadingStatus.success &&
            state.user == null) {
          context.go(AppRoutesStings.loginPath);
          // Navigator.pushReplacementNamed(context, '/login');
        }
      },
      child: Image.asset(
        AppStrings.loadingSplashImg,
      ),
    );
  }
}
