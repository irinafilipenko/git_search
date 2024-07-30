import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/data/loading_status.dart';

import 'package:git_search/presentation/screens/login/bloc/login_bloc.dart';
import 'package:git_search/presentation/screens/login/bloc/login_state.dart';
import 'package:git_search/presentation/screens/login/components/custom_button.dart';
import 'package:git_search/presentation/screens/login/components/custom_text_field.dart';
import 'package:git_search/presentation/screens/login/components/validation.dart';

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

  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isLoading = false;

  void _validateEmail(String email) {
    if (!_isLoading) {
      setState(() {
        _isEmailValid = Validation.validateEmail(email);
      });
    }
  }

  void _validatePassword(String password) {
    if (!_isLoading) {
      setState(() {
        _isPasswordValid = Validation.validatePassword(password);
      });
    }
  }

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
    _validateEmail(email);
    _validatePassword(password);
    if (_isEmailValid && _isPasswordValid) {
      setState(() {
        _isLoading = true;
        _isEmailValid = true;
        _isPasswordValid = true;
      });
      _resetFields(); // Clear the text fields immediately
      FocusScope.of(context).unfocus(); // Remove focus from all fields

      context
          .read<LoginBloc>()
          .add(LoginRequested(email: email, password: password));
    }
  }

  void _resetFields() {
    _emailController.clear();
    _passwordController.clear();
    setState(() {
      _isEmailValid = true;
      _isPasswordValid = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        print(state.status);

        if (state.status == LoadingStatus.success) {
          Timer(const Duration(microseconds: 10), () {
            setState(() {
              _isLoading = false;
            });
            _resetFields();
            // Navigator.of(context).pushReplacement(createRoute());
            Navigator.pushReplacementNamed(context, '/main');
          });
        } else if (state.status == LoadingStatus.failure) {
          setState(() {
            _isLoading = false;
            _isEmailValid = true;
            _isPasswordValid = true;
          });
          // ScaffoldMessenger.of(context).showSnackBar(
          //   customSnackBar(message: state.message, context: context),
          // );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign in',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1A1C1E))),
            const SizedBox(height: 60),
            CustomTextField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              labelText: 'Email',
              hintText: 'Enter your email',
              isValid: _isEmailValid,
              isLoading: _isLoading,
              onChanged: (value) {
                setState(() {
                  _isEmailValid = true;
                });
              },
              onValidate: _validateEmail,
            ),
            const SizedBox(height: 36),
            CustomTextField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              labelText: 'Password',
              hintText: 'Enter your password',
              isValid: _isPasswordValid,
              isLoading: _isLoading,
              onChanged: (value) {
                setState(() {
                  _isPasswordValid = true;
                });
              },
              onValidate: _validatePassword,
              isObscure: true,
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: 'Log in',
              isLoading: _isLoading,
              onPressed: _handleLogin,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
