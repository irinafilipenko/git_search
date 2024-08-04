import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';

import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';
import 'package:git_search/presentation/screens/login/bloc/login_state.dart';
import 'package:git_search/presentation/screens/login/components/custom_button.dart';
import 'package:git_search/presentation/screens/login/components/custom_snack_bar.dart';
import 'package:git_search/presentation/screens/login/components/custom_text_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  LoginBodyState createState() => LoginBodyState();
}

class LoginBodyState extends State<LoginBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _handleLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Remove focus from all text fields
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();

    // Trigger validation
    context.read<LoginBloc>().add(ValidateEmailEvent(email: email));
    context.read<LoginBloc>().add(ValidatePasswordEvent(password: password));

    // Add login request event if fields are valid
    if (context.read<LoginBloc>().state.isEmailValid &&
        context.read<LoginBloc>().state.isPasswordValid) {
      context
          .read<LoginBloc>()
          .add(LoginRequestedEvent(email: email, password: password));
    }
  }

  void _resetFields() {
    _emailController.clear();
    _passwordController.clear();

    context
        .read<LoginBloc>()
        .add(ResetFieldsEvent(isEmailValid: true, isPasswordlValid: true));
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((LoginBloc bloc) {
      return bloc.state.status == LoadingStatus.loading;
    });

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.status) {
          case LoadingStatus.success:
            Timer(const Duration(microseconds: 10), () {
              _resetFields();
              Navigator.pushReplacementNamed(context, '/home');
            });
            break;

          case LoadingStatus.failure:
            context.read<LoginBloc>().add(
                ResetFieldsEvent(isEmailValid: true, isPasswordlValid: true));

            if (state.errorMessage != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(message: state.errorMessage!, context: context),
              );
            }
            break;

          case LoadingStatus.loading:
            break;

          case LoadingStatus.initial:
            break;
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppStrings.signInText,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1C1E))),
            const SizedBox(height: 60),
            CustomTextField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              labelText: AppStrings.emailLabelText,
              hintText: AppStrings.emailHintText,
              isValid: context.watch<LoginBloc>().state.isEmailValid,
              isLoading: isLoading,
              onChanged: (value) {
                context.read<LoginBloc>().add(ChangeEmailEvent(email: value));
              },
              onValidate: (value) {
                context.read<LoginBloc>().add(ValidateEmailEvent(email: value));
              },
            ),
            const SizedBox(height: 36),
            CustomTextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              labelText: AppStrings.passwordLabelText,
              hintText: AppStrings.passwordHintText,
              isValid: context.watch<LoginBloc>().state.isPasswordValid,
              isLoading: isLoading,
              onChanged: (value) {
                context
                    .read<LoginBloc>()
                    .add(ChangePasswordEvent(password: value));
              },
              onValidate: (value) {
                context
                    .read<LoginBloc>()
                    .add(ValidatePasswordEvent(password: value));
              },
              isObscure: true,
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: AppStrings.logInText,
              isLoading: isLoading,
              onPressed: _handleLogin,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
