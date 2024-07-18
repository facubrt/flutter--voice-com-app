import 'package:dartz/dartz.dart';
import 'package:voicecom/core/errors/failures.dart';
import 'package:voicecom/src/favorites/domain/entities/favorite.dart';
import 'package:voicecom/src/favorites/domain/repositories/favorites_repository.dart';

class FavoritesService {
  final FavoritesRepository repository;

  FavoritesService({required this.repository});

  Future<Either<Failure, List<Favorite>>> getFavorites() => repository.getFavorites();

  Future<Either<Failure, bool>> addFavorite(Favorite favorite) => repository.addFavorite(favorite);

  Future<Either<Failure, bool>> removeFavorite(int id) => repository.removeFavorite(id);
}