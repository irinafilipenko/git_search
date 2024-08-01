import 'package:dio/dio.dart';
import 'package:git_search/data/service/login_service.dart';
import 'package:git_search/data/models/login_model.dart';

class UserRepository {
  final LoginService _userService;

  UserRepository(Dio dio) : _userService = LoginService(dio);

  Future<LoginModel> login(String email, String password) async {
    print("login");

    final response = await _userService.getUser();

    return response;
  }
}

// class UserRepository {
//   final LoginService _userService = LoginService();
//
//   Future<LoginModel> login(String email, String password) async {
//     final response = await _userService.getUser('https://randomuser.me/api/');
//     return LoginModel.fromJson(response.data['results'][0]);
//   }
//
// }

// class UserRepository {
//   final Dio _dio = Dio();
//   late final LoginService _userService;
//
//   UserRepository() {
//     _userService = LoginService(_dio);
//   }
//
//   Future<LoginModel> login(String email, String password) async {
//     final response = await _userService.getUser("api/");
//
//     return response;
//   }
// }
