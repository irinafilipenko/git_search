import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:git_search/constants.dart';
import 'package:git_search/screens/favorite/favorite_controller.dart';

class FavoriteBody extends GetView<FaivoriteController> {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(() {
                return Visibility(
                    visible: controller.favoriteList.isEmpty,
                    child: Expanded(
                      child: Center(
                          child: Text(
                              "You have no favorites. \n Click on star while searching to add first favorite",
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: kPlaceholderScreenTextStyle)),
                    ));
              }),
              Obx(() {
                return Visibility(
                    visible: controller.favoriteList.isNotEmpty,
                    child: Expanded(
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              width: double.infinity,
                              height: 55,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2F2F2),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                leading: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.3,
                                  child: Text(
                                    controller.favoriteList[index].name,
                                    style: kItemTextStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                trailing: InkWell(
                                  onTap: () {
                                    controller.onChangeFavotite(index);
                                  },
                                  child: controller
                                          .favoriteList[index].isFavorite!
                                      ? SvgPicture.asset(
                                          "assets/icons/favorite.svg")
                                      : SvgPicture.asset(
                                          "assets/icons/favorite_active.svg"),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: controller.favoriteList.length > 15
                              ? 15
                              : controller.favoriteList.length),
                    ));
              })
            ]));
  }
}
