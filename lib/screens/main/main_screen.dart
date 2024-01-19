import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:git_search/constants.dart';
import 'package:git_search/screens/favorite/favorite_screen.dart';
import 'package:git_search/screens/main/components/main_body.dart';
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
            )
          ],
        ),
        body: const SafeArea(
          child: MainBody(),
        ));
  }
}
