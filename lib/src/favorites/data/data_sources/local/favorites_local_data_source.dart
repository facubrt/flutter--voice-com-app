import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:voicecom/core/errors/failures.dart';
import 'package:voicecom/src/favorites/data/models/favorites_model.dart';
import 'package:voicecom/src/favorites/domain/entities/favorite.dart';

abstract class FavoritesLocalDataSource {
  Future<bool> addFavorite(Favorite fav);
  Future<List<Favorite>> getFavorites();
  Future<bool> removeFavorite(int id);
}

class HiveFavoritesLocalDataSource implements FavoritesLocalDataSource {

  HiveFavoritesLocalDataSource() {
    Hive.initFlutter();
  }

  @override
  Future<bool> addFavorite(Favorite favorite) async {
    try {
      Box<dynamic> box = await Hive.openBox('favorites');
      box.add(FavoriteModel.fromEntity(favorite).toJson());
      return true;
    } catch (e)  {  
      debugPrint(e.toString());
      throw LocalFailure(message: e.toString());
    }
  }

  @override
  Future<List<Favorite>> getFavorites() async {
    try {
      Box<dynamic> box = await Hive.openBox('favorites');
      return box.values.map((favorite) => FavoriteModel.fromJson(favorite)).toList();
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure(message: e.toString());
    }
  }

  @override
  Future<bool> removeFavorite(int id) async {
    try {
      Box<dynamic> box = await Hive.openBox('favorites');
      box.deleteAt(id);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      throw LocalFailure(message: e.toString());
    }
  }

}