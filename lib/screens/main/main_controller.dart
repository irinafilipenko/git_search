import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:git_search/screens/main/main_model.dart';
import 'package:git_search/screens/main/main_provider.dart';
import 'package:git_search/services/get_storage_service.dart';

class MainController extends GetxController {
  GetStorageService getStorageService = Get.find();
  late final TextEditingController textController;

  Rx<MainModel> data = MainModel(items: []).obs;

  RxString loadingState = "start".obs;
  RxString inputText = "".obs;

  @override
  onInit() async {
    textController = TextEditingController();
    if (getStorageService.listHistorySearch.value.items.isNotEmpty) {
      loadingState.value = "history";
    }
    super.onInit();
  }

  Future getData() async {
    data.value.items.clear();
    await MainProvider.getData("repositories?q=${inputText.value}&per_page=15")
        .then((result) async {
      data.value = result;
      if (data.value.items.isNotEmpty) {
        loadingState.value = "loaded";
        getStorageService.listHistorySearch.value.items
            .insertAll(0, data.value.items);
        getStorageService.dataSave();
      } else {
        loadingState.value = "isEmpty";
      }
    });
    data.refresh();
  }

  onDeleteInput() {
    textController.text = "";
    inputText.value = "";
    data.value.items.clear();
    loadingState.value = "clearInput";
  }

  updateHistoryListFavoriteStatus(index) {
    getStorageService.listHistorySearch.value.items[index].isFavorite =
        !getStorageService.listHistorySearch.value.items[index].isFavorite!;
    getStorageService.listHistorySearch.refresh();
    getStorageService.dataSave();
  }

  updateSearhListFavoriteStatus(index) {
    data.value.items[index].isFavorite = !data.value.items[index].isFavorite!;
    var item = getStorageService.listHistorySearch.value.items.firstWhere(
      (item) => item.id == data.value.items[index].id,
    );
    if (getStorageService.listHistorySearch.value.items.contains(item)) {
      item.isFavorite = data.value.items[index].isFavorite;
    }
    getStorageService.dataSave();
    data.refresh();
  }

  onSearchChanged(value) async {
    inputText.value = value;
    if (inputText.value.isNotEmpty) {
      loadingState.value = "loading";
      await getData();
    }
  }
}
