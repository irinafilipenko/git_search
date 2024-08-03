import 'package:git_search/data/models/main_model.dart';
import 'package:git_search/data/service/services.dart';

class MainRepository {
  final MainService _mainService;
  // final LocalDataStorage _localDataStorage;

  MainRepository(
    this._mainService,
  );

  Future<MainResponse> getRepository(String searchText) async {
    final response = await _mainService.getRequest(searchText);
    return response;
  }

  // Future<void> saveUserToCache(LoginModel user) async {
  //   await _localDataStorage.userToCache(user);
  // }
}
