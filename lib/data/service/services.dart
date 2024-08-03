import 'package:git_search/data/models/login_model.dart';
import 'package:git_search/data/models/main_model.dart';
import 'package:git_search/presentation/constants/constants.dart';
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
abstract class MainService {
  factory MainService(Dio dio, {String baseUrl}) = _MainService;

  @GET("/{variables}")
  Future<MainResponse> getRequest(@Path("variables") String variables);
}
