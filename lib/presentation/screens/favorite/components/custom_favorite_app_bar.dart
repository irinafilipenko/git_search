import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:git_search/presentation/resurces/app_strings.dart';
import 'package:git_search/presentation/resurces/constants.dart';
import 'package:git_search/presentation/routes/app_routes_stings.dart';
import 'package:go_router/go_router.dart';

class CustomFavoriteAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomFavoriteAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: InkWell(
        child: SvgPicture.asset(
          AppStrings.favoriteBackButton,
          fit: BoxFit.scaleDown,
        ),
        onTap: () {
          context.go(AppRoutesStings.homePath);
        },
      ),
      title: Text(
        AppStrings.headFavoriteAppBarText,
        style: kAppBarTextStyle,
      ),
      centerTitle: true,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: Container(
            color: const Color(0xFFF2F2F2),
            height: 3.0,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
