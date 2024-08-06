import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/main.dart';
import 'package:git_search/presentation/screens/home/bloc/home_bloc.dart';
import 'package:git_search/presentation/screens/home/components/custom_app_bar.dart';
import 'package:git_search/presentation/screens/home/components/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: const Scaffold(
          appBar: CustomAppBar(),
          body: SafeArea(
            child: HomeBody(),
          )),
    );
  }
}
