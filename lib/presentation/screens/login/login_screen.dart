import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';

import 'package:git_search/presentation/screens/login/components/login_body.dart';

import '../../../main.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>(),
      child: const Scaffold(
        body: SafeArea(
          child: LoginBody(),
        ),
      ),
    );
  }
}
