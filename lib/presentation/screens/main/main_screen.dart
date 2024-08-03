import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/presentation/constants/constants.dart';
import 'package:git_search/presentation/screens/favorite/favorite_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_controller.dart';

class MainScreen extends GetView<MainController> {
  static String routeName = '/main';

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Get.toNamed(FavoriteScreen.routeName)!
                      .then((value) => controller.data.refresh());
                },
                child: SvgPicture.asset(
                  "assets/icons/icon_button_star.svg",
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.logout, color: Colors.black),
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove(LocalDataStorageImpl.CACHE_USER);
                // Get.offAllNamed(LoginScreen.routeName);
              },
            ),
          ],
        ),
        body: SafeArea(
          child: Container(color: Colors.amber),
          // child: MainBody(),
        ));
  }
}
