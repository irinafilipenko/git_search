import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_search/components/item_card.dart';
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
                            return ItemCard(
                              name: controller.favoriteList[index].name,
                              favorite:
                                  controller.favoriteList[index].isFavorite!,
                              onPressed: () {
                                controller.onChangeFavotite(index);
                              },
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
