import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_favorite_command.g.dart';

@riverpod
class GetFavoriteCommand extends _$GetFavoriteCommand {
  @override
  AsyncValue<List<FavoriteMovie>> build() => AsyncLoading();

  Future<void> execute() async {
    final repo = ref.read(moviesRepositoryProvider);
    final result = await repo.getMyFavoritesMovies();
    state = switch (result) {
      Success(:final value) => AsyncData(value),
      Failure() => AsyncError(Exception('Erro ao buscar filmes favoritos'), StackTrace.current),
    };
  }
}
