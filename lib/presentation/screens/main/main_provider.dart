import 'package:git_search/data/api/api_service.dart';
import 'package:git_search/presentation/screens/main/main_model.dart';

class MainProvider {
  static Future<MainModel> getData(variables) async {
    return MainModel.fromJson(await ApiService.getRequest(variables));
  }
}
