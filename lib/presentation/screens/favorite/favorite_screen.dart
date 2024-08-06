import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_search/main.dart';
import 'package:git_search/presentation/screens/favorite/bloc/favorite_bloc.dart';
import 'package:git_search/presentation/screens/favorite/components/custom_favorite_app_bar.dart';
import 'package:git_search/presentation/screens/favorite/components/favorite_body.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<FavoriteBloc>()..add(FavoriteLocalRequestedEvent()),
      child: const Scaffold(
          appBar: CustomFavoriteAppBar(),
          body: SafeArea(
            child: FavoriteBody(),
          )),
    );
  }
}
