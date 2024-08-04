import 'package:git_search/data/models/home_model.dart';
import 'package:git_search/data/service/services.dart';

class HomeRepository {
  final HomeService _homeService;
  // final LocalDataStorage _localDataStorage;

  HomeRepository(
    this._homeService,
  );

  Future<HomeResponse> getRepository(String searchText) async {
    final response = await _homeService.getRequest(searchText);
    return response;
  }

  // Future<void> saveUserToCache(LoginModel user) async {
  //   await _localDataStorage.userToCache(user);
  // }
}
