import 'package:flutter/material.dart';

import 'package:git_search/presentation/screens/login/components/login_body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = '/';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: LoginBody(),
    ));
  }
}
