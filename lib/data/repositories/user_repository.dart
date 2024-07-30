import 'package:git_search/data/service/login_service.dart';
import 'package:git_search/data/models/login_model.dart';

class UserRepository {
  final LoginService _userService = LoginService();

  Future<LoginModel> login(String email, String password) async {
    final response = await _userService.getUser('https://randomuser.me/api/');
    return LoginModel.fromJson(response.data['results'][0]);
  }
}
