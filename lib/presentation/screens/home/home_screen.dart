import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/main.dart';
import 'package:git_search/presentation/resurces/constants.dart';
import 'package:git_search/presentation/screens/home/bloc/home_bloc.dart';
import 'package:git_search/presentation/screens/home/components/home_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: Scaffold(
          appBar: AppBar(
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarIconBrightness:
                  Brightness.dark, // For Android (dark icons)
              statusBarBrightness: Brightness.light, // For iOS (dark icons)
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              "Github repos list",
              style: kAppBarTextStyle,
            ),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(6.0),
                child: Container(
                  color: const Color(0xFFF2F2F2),
                  height: 3.0,
                )),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: InkWell(
                  onTap: () {
                    // Get.toNamed(FavoriteScreen.routeName)!
                    //     .then((value) => controller.data.refresh());
                  },
                  child: SvgPicture.asset(
                    "assets/icons/icon_button_star.svg",
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.black),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove(LocalDataStorageImpl.cacheUser);
                  // Get.offAllNamed(LoginScreen.routeName);
                },
              ),
            ],
          ),
          body: const SafeArea(
            // child: Container(color: Colors.amber),
            child: HomeBody(),
          )),
    );
  }
}
