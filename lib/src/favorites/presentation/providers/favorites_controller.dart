
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:voicecom/src/favorites/application/services/favorites_service.dart';
import 'package:voicecom/src/favorites/data/data_sources/local/favorites_local_data_source.dart';
import 'package:voicecom/src/favorites/data/repositories/favorites_repository_impl.dart';
import 'package:voicecom/src/favorites/domain/entities/favorite.dart';

part 'favorites_controller.g.dart';

@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  late FavoritesService service = FavoritesService(
    repository: FavoritesRepositoryImpl(
      localDataSource: HiveFavoritesLocalDataSource(),
    ),
  );
  
  @override
  List<Favorite> build() => [];

  Future<List<Favorite>> getFavorites() async {
    final result = await service.getFavorites();

    return result.fold(
      (l) => throw l, 
      (r) {
        state = r;
        return r;
      }
      );
  }

  Future<bool> addFavorite({required String text}) async {
    final favorite = Favorite(text: text);
    final result = await service.addFavorite(favorite);
    return result.fold((l) => throw l, (r) {
      state = [...state, favorite];
      return r;
    });
  }

  Future<bool> removeFavorite({required int id}) async {
    final result = await service.removeFavorite(id);
    return result.fold((l) => throw l, (r) {
      state.removeAt(id);
      return r;
    });
  }
}