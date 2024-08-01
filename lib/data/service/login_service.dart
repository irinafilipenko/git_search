import 'package:git_search/data/models/login_model.dart';
import 'package:git_search/presentation/constants/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
// Import your model

part 'login_service.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @GET("/api/")
  Future<LoginModel> getUser();
}

// @RestApi(baseUrl: kBaseUrl)
// abstract class LoginService {
//   factory LoginService(Dio dio, {String baseUrl}) = _LoginService;
//
//   @GET("/user")
//   Future<LoginModel> getUser(@Query("url") String url);
// }

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
