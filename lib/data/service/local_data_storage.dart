import 'dart:convert';

import 'package:git_search/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataStorage {
  Future<LoginModel> getUserFromCache();
  Future<void> userToCache(LoginModel user);
}

const CACHED_USER = 'CACHED_USER';

class LocalDataStorageImpl implements LocalDataStorage {
  final SharedPreferences sharedPreferences;

  LocalDataStorageImpl({required this.sharedPreferences});

  @override
  Future<LoginModel> getUserFromCache() {
    final jsonUser = sharedPreferences.getString(CACHED_USER);
    if (jsonUser != null && jsonUser.isNotEmpty) {
      print('Get User from Cache: $jsonUser');
      final userMap = json.decode(jsonUser);
      final user = LoginModel.fromJson(userMap);
      return Future.value(user);
    } else {
      print("User not found");
      throw Exception();
    }
  }

  @override
  Future<void> userToCache(LoginModel user) async {
    await sharedPreferences.setString(CACHED_USER, user.toString());
    // final LoginModel user =
    //     persons.map((person) => json.encode(person.toJson())).toList();
    //
    // sharedPreferences.setStringList(CACHED_USER, jsonPersonsList);
    // print('Persons to write Cache: ${jsonPersonsList.length}');
    // return Future.value(jsonPersonsList);
  }
}
