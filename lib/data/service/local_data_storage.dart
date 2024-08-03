import 'dart:convert';

import 'package:git_search/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataStorage {
  Future<LoginModel> getUserFromCache();
  Future<void> userToCache(LoginModel user);
}

const CACHE_USER = 'CACHE_USER';

class LocalDataStorageImpl implements LocalDataStorage {
  final SharedPreferences sharedPreferences;

  LocalDataStorageImpl({required this.sharedPreferences});

  @override
  Future<LoginModel> getUserFromCache() {
    final jsonUser = sharedPreferences.getString(CACHE_USER);
    if (jsonUser != null && jsonUser.isNotEmpty) {
      print('Get User from Cache: $jsonUser');
      final Map<String, dynamic> userMap =
          json.decode(jsonUser) as Map<String, dynamic>;
      print('userMap $userMap');
      final user = LoginModel.fromJson(userMap);
      return Future.value(user);
    } else {
      print("User not found");
      throw Exception();
    }
  }

  @override
  Future<void> userToCache(LoginModel user) async {
    final jsonString = json.encode(user.toJson());
    await sharedPreferences.setString(CACHE_USER, jsonString);
  }
}
