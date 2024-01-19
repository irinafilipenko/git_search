import 'dart:convert';
import 'package:get/get.dart';
import 'package:git_search/screens/main/main_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetStorageService extends GetxService {
  Rx<MainModel> listHistorySearch = MainModel(items: []).obs;

  Future init() async {
    await dataLoad();
    return this;
  }

  dataLoad() async {
    final prefs = await SharedPreferences.getInstance();
    listHistorySearch.value = prefs.getString('history_save') == null
        ? MainModel(items: [])
        : dataFromJson(prefs.getString('history_save')!);
  }

  dataSave() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('history_save', jsonEncode(listHistorySearch.value));
  }
}
