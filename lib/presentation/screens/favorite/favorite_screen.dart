import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/main.dart';
import 'package:git_search/presentation/resurces/constants.dart';
import 'package:git_search/presentation/screens/favorite/bloc/favorite_bloc.dart';
import 'package:git_search/presentation/screens/favorite/components/favorite_body.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<FavoriteBloc>()..add(FavoriteLocalRequestedEvent()),
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.light,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: InkWell(
              child: SvgPicture.asset(
                "assets/icons/icon_button.svg",
                fit: BoxFit.scaleDown,
              ),
              onTap: () {
                context.go('/home');
              },
            ),
            title: Text(
              "Favorite repos list",
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(6.0),
                child: Container(
                  color: const Color(0xFFF2F2F2),
                  height: 3.0,
                )),
          ),
          body: SafeArea(
            child: FavoriteBody(),
          )),
    );
  }
}
