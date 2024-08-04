import 'package:git_search/data/models/login_model.dart';
import 'package:git_search/data/models/home_model.dart';
import 'package:git_search/presentation/resurces/constants.dart';
import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';
// Import your model

part 'services.g.dart';

@RestApi(baseUrl: kBaseUrl)
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @GET("/api/")
  Future<LoginResponse> getUser();
}

@RestApi(baseUrl: kBaseMainUrl)
abstract class HomeService {
  factory HomeService(Dio dio, {String baseUrl}) = _HomeService;

  @GET("/{variables}")
  Future<HomeResponse> getRequest(@Path("variables") String variables);
}
