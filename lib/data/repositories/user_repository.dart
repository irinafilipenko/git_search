import 'package:git_search/data/service/local_data_storage.dart';
import 'package:git_search/data/service/services.dart';
import 'package:git_search/data/models/login_model.dart';

class UserRepository {
  final LoginService _userService;
  final LocalDataStorage _localDataStorage;

  UserRepository(this._userService, this._localDataStorage);

  Future<LoginModel> login(String email, String password) async {
    final response = await _userService.getUser();
    return response.results.first;
  }

  Future<void> saveUserToCache(LoginModel user) async {
    await _localDataStorage.userToCache(user);
  }
}
