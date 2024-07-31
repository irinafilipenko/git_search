import 'package:git_search/data/models/login_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
// Import your model

part 'login_service.g.dart';

@RestApi(baseUrl: 'https://randomuser.me/') // Replace with your base URL
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @GET("/user")
  Future<LoginModel> getUser(
      @Query("url") String url); // Adjust the path and parameters as needed
}

// import 'package:dio/dio.dart';
//
// class LoginService {
//   final Dio _dio = Dio();
//
//   Future<Response> getUser(String url) async {
//     final response = await _dio.get(
//       url,
//     );
//     return response;
//   }
// }
