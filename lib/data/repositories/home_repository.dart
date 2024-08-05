import 'package:git_search/data/models/home_model.dart';
import 'package:git_search/data/service/services.dart';

class HomeRepository {
  final HomeService _homeService;
  // final LocalDataStorage _localDataStorage;

  HomeRepository(
    this._homeService,
  );

  Future<List<HomeModel>> getRepository(String searchText) async {
    print(" getRepository");
    final response = await _homeService.getRequest(searchText);
    print(response.items);
    return response.items;
  }

  // Future<void> saveUserToCache(LoginModel user) async {
  //   await _localDataStorage.userToCache(user);
  // }
}
