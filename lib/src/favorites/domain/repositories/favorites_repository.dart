import 'package:dartz/dartz.dart';
import 'package:voicecom/core/errors/failures.dart';
import 'package:voicecom/src/favorites/domain/entities/favorite.dart';

abstract class FavoritesRepository {
  Future<Either<Failure,List<Favorite>>> getFavorites();
  Future<Either<Failure, bool>> addFavorite(Favorite fav);
  Future<Either<Failure, bool>> removeFavorite(int id);
}