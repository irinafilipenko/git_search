import 'package:git_search/data/models/home_model.dart';
import 'package:git_search/data/service/services.dart';

class HomeRepository {
  final HomeService _homeService;
  HomeRepository(
    this._homeService,
  );

  Future<List<HomeModel>> getRepository(String searchText) async {
    final response = await _homeService.getRequest(searchText);
    return response.items;
  }
}
