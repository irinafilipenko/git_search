import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:git_search/screens/favorite/components/favorite_body.dart';
import '../../constants.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = '/favorite';

  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 13),
            child: InkWell(
              child: SvgPicture.asset(
                "assets/icons/icon_button.svg",
                fit: BoxFit.scaleDown,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
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
        body: const SafeArea(
          child: FavoriteBody(),
        ));
  }
}
