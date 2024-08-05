import 'dart:convert';
import 'package:git_search/data/models/home_model.dart';
import 'package:git_search/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataStorage {
  Future<LoginModel?> getUserFromCache();
  Future<void> userToCache(LoginModel user);
  Future<List<HomeModel>> getFavoriteRepositoriesFromCache();
  Future<void> favoriteRepositoriesToCache(List<HomeModel> repositories);
  Future<void> deleteRepositoriesToCache(List<HomeModel> repositories);
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
      return null;
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
      return [];
    }
  }

  @override
  Future<void> favoriteRepositoriesToCache(List<HomeModel> repositories) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    // Retrieve existing favorite repositories
    final jsonExistingFavorites =
        sharedPreferences.getString(cacheFavoriteRepositories);
    List<HomeModel> existingFavorites = [];
    if (jsonExistingFavorites != null && jsonExistingFavorites.isNotEmpty) {
      List<dynamic> decodedJson = json.decode(jsonExistingFavorites);
      existingFavorites = decodedJson
          .map((repo) => HomeModel.fromJson(repo as Map<String, dynamic>))
          .toList();
    }

    // Filter new favorite repositories
    final newFavorites = repositories.where((repo) => repo.isFavorite).toList();

    // Merge existing and new favorites, avoiding duplicates
    final mergedFavorites = {...existingFavorites, ...newFavorites}.toList();

    // Save merged favorites to cache
    final jsonString =
        json.encode(mergedFavorites.map((repo) => repo.toJson()).toList());
    // print(jsonString);
    await sharedPreferences.setString(cacheFavoriteRepositories, jsonString);
  }

  @override
  Future<void> deleteRepositoriesToCache(List<HomeModel> updatedList) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    // Serialize the updated list to JSON
    final jsonString =
        json.encode(updatedList.map((repo) => repo.toJson()).toList());

    // Save the updated list to cache
    await sharedPreferences.setString(cacheFavoriteRepositories, jsonString);
  }
}
