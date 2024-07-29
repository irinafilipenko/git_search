import 'package:git_search/core/sevice/login_service.dart';
import 'package:git_search/screens/login/login_model.dart';

class UserRepository {
  final UserService _userService = UserService();

  Future<LoginModel> login(String email, String password) async {
    final response = await _userService.getUser('https://randomuser.me/api/');
    return LoginModel.fromJson(response.data['results'][0]);
  }
}
