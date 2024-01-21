import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:git_search/components/item_card.dart';
import 'package:git_search/constants.dart';
import 'package:git_search/screens/main/main_controller.dart';

class MainBody extends GetView<MainController> {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF2F2F2),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Obx(() {
              return TextField(
                controller: controller.textController,
                onSubmitted: (value) {
                  controller.onSearchChanged(value);
                },
                onChanged: (value) {
                  controller.inputText.value = value;
                },
                cursorColor: kMainAppColor,
                cursorWidth: 1,
                maxLines: 1,
                style: kItemTextStyle,
                decoration: InputDecoration(
                  suffixIcon: controller.inputText.value.isNotEmpty
                      ? InkWell(
                          onTap: () {
                            controller.onDeleteInput();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/close.svg',
                            fit: BoxFit.scaleDown,
                          ))
                      : null,
                  prefixIcon: InkWell(
                    onTap: () {
                      controller.onSearchChanged(controller.inputText.value);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  hintText: 'Search',
                  hintStyle: kPlaceholderTextStyle,
                  isCollapsed: true,
                  contentPadding:
                      const EdgeInsets.only(top: 16, bottom: 16, right: 16),
                  fillColor: kMainAppColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: kMainAppColor, width: 2),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  enabledBorder:
                      const UnderlineInputBorder(borderSide: BorderSide.none),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  errorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedErrorBorder: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 16,
          ),
          Obx(() {
            return Visibility(
                visible: controller.loadingState.value == "clearInput",
                child: Container());
          }),
          Obx(() {
            return Visibility(
              visible: controller.loadingState.value == "start" ||
                  controller.loadingState.value == "history",
              child: const Text("Search History",
                  style: TextStyle(
                      color: kMainAppColor,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
            );
          }),
          Obx(() {
            return Visibility(
              visible: controller.loadingState.value == "loaded" ||
                  controller.loadingState.value == "isEmpty",
              child: const Text("What we have found",
                  style: TextStyle(
                      color: kMainAppColor,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w600,
                      fontSize: 16)),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return Visibility(
                visible: controller.loadingState.value == "loading",
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoActivityIndicator(),
                  ],
                ));
          }),
          Obx(() {
            return Visibility(
                visible: controller.loadingState.value == "history",
                child: Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCard(
                          name: controller.getStorageService.listHistorySearch
                              .value.items[index].name,
                          favorite: controller.getStorageService
                              .listHistorySearch.value.items[index].isFavorite!,
                          onPressed: () {
                            controller.updateHistoryListFavoriteStatus(index);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: controller.getStorageService.listHistorySearch
                                  .value.items.length >
                              15
                          ? 15
                          : controller.getStorageService.listHistorySearch.value
                              .items.length),
                ));
          }),
          Obx(() {
            return Visibility(
                visible: controller.loadingState.value == "loaded",
                child: Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemCard(
                          name: controller.data.value.items[index].name,
                          favorite:
                              controller.data.value.items[index].isFavorite!,
                          onPressed: () {
                            controller.updateSearhListFavoriteStatus(index);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: controller.data.value.items.length),
                ));
          }),
          Obx(() {
            return Visibility(
                visible: controller.loadingState.value == "start" &&
                    controller.getStorageService.listHistorySearch.value.items
                        .isEmpty,
                child: Expanded(
                  child: Center(
                      child: Text(
                          "You have empty history.\n Click on search to start journey!",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: kPlaceholderScreenTextStyle)),
                ));
          }),
          Obx(() {
            return Visibility(
                visible: controller.loadingState.value == "isEmpty" &&
                    controller.data.value.items.isEmpty,
                child: Expanded(
                  child: Center(
                      child: Text(
                          "Nothing was find for your search.\n Please check the spelling",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: kPlaceholderScreenTextStyle)),
                ));
          })
        ],
      ),
    );
  }
}
