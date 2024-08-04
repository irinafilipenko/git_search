import 'package:dio/dio.dart';
import 'package:git_search/data/service/services.dart';
import 'package:git_search/presentation/di/modules/module.dart';
import '../../../main.dart';

class ServiceModule implements Module {
  @override
  Future<void> dependency() async {
    _initDio();
    Dio dio = sl.get<Dio>();
    sl.registerLazySingleton<LoginService>(() => LoginService(dio));
    sl.registerLazySingleton<HomeService>(() => HomeService(dio));
  }

  void _initDio() {
    final dio = Dio();
    dio.options.headers["content-type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    // dio.options.baseUrl = kBaseUrl;
    dio.options.connectTimeout = const Duration(milliseconds: 30000);
    dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    // dio.options.headers["Inner-Token"] = AppConstants.innerToken;
    // dio.options.sendTimeout = 30000;
    // dio.interceptors.add(LogInterceptor(
    //     requestBody: true, responseBody: true, logPrint: logger.d));
    //
    // dio.interceptors.add(InterceptorsWrapper(
    //     onError: (dioError, handler) => _errorInterceptor(dioError)));
    // dio.options.headers['content-language'] = locale?.languageCode;
    sl.registerLazySingleton<Dio>(() => dio);
  }

  // _errorInterceptor(DioError dioError) async {
  //   if (dioError.response?.statusCode == 401 ||
  //       dioError.response?.statusCode == 423) {
  //     sl.get<CacheManager>().clear();
  //     navigatorKey.currentState?.pushAndRemoveUntil(
  //         CupertinoPageRoute(
  //           builder: (_) => LoginScreen(),
  //         ),
  //         (settings) => false);
  //   } else {
  //     return dioError;
  //   }
  // }
}
