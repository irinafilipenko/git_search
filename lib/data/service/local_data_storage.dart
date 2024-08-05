import 'dart:convert';

import 'package:git_search/data/models/home_model.dart';
import 'package:git_search/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataStorage {
  Future<LoginModel?> getUserFromCache();
  Future<void> userToCache(LoginModel user);
  Future<List<HomeModel>> getFavoriteRepositoriesFromCache();
  Future<void> favoriteRepositoriesToCache(List<HomeModel> repositories);
}

class LocalDataStorageImpl implements LocalDataStorage {
  static const cacheUser = 'CACHE_USER';
  static const cacheFavoriteRepositories = 'CACHE_FAVORITE_REPOSITORIES';

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

  @override
  Future<List<HomeModel>> getFavoriteRepositoriesFromCache() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final jsonRepositories =
        sharedPreferences.getString(cacheFavoriteRepositories);
    if (jsonRepositories != null && jsonRepositories.isNotEmpty) {
      final List<dynamic> repositoryList = json.decode(jsonRepositories);
      return repositoryList.map((repo) => HomeModel.fromJson(repo)).toList();
    } else {
      print("No favorite repositories found");
      return [];
    }
  }

  @override
  Future<void> favoriteRepositoriesToCache(List<HomeModel> repositories) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final favoriteRepositories =
        repositories.where((repo) => repo.isFavorite).toList();
    final jsonString =
        json.encode(favoriteRepositories.map((repo) => repo.toJson()).toList());
    print(jsonString);
    await sharedPreferences.setString(cacheFavoriteRepositories, jsonString);
  }
}
