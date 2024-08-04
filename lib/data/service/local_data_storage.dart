import 'dart:convert';

import 'package:git_search/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataStorage {
  Future<LoginModel?> getUserFromCache();
  Future<void> userToCache(LoginModel user);
}

class LocalDataStorageImpl implements LocalDataStorage {
  static const cacheUser = 'CACHE_USER';

  @override
  Future<LoginModel?> getUserFromCache() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonUser = sharedPreferences.getString(cacheUser);
    if (jsonUser != null && jsonUser.isNotEmpty) {
      // print('Get User from Cache: $jsonUser');
      final Map<String, dynamic> userMap =
          json.decode(jsonUser) as Map<String, dynamic>;

      final user = LoginModel.fromJson(userMap);
      return Future.value(user);
    } else {
      print("User not found");
      return null;
      // throw Exception();
    }
  }

  @override
  Future<void> userToCache(LoginModel user) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = json.encode(user.toJson());
    await sharedPreferences.setString(cacheUser, jsonString);
  }
}
