import 'package:get/get.dart';
import 'package:git_search/services/get_storage_service.dart';
import '../main/main_model.dart';

class FaivoriteController extends GetxController {
  GetStorageService getStorageService = Get.find();

  RxList<Items> favoriteList = <Items>[].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() {
    favoriteList.value = getStorageService.listHistorySearch.value.items
        .where((item) => item.isFavorite == true)
        .toList();
    favoriteList.refresh();
  }

  onChangeFavotite(index) {
    favoriteList[index].isFavorite = !favoriteList[index].isFavorite!;
    var item = getStorageService.listHistorySearch.value.items.firstWhere(
      (item) => item.id == favoriteList[index].id,
    );

    if (getStorageService.listHistorySearch.value.items.contains(item)) {
      item.isFavorite = false;

      getStorageService.listHistorySearch.refresh();
    }
    getStorageService.dataSave();
    getData();
  }
}
