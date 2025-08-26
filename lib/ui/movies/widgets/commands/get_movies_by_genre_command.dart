import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/usescases/usescases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_movies_by_genre_command.g.dart';

@riverpod
class GetMoviesByGenreCommand extends _$GetMoviesByGenreCommand {
  @override
  AsyncValue<List<Movie>> build() => AsyncLoading();

  Future<void> execute(int genreId) async {
    state = AsyncLoading();
    final genreUC = ref.read(getMoviesByGenreUsecaseProvider);
    final Result<List<Movie>> result = await genreUC.execute(genreId: genreId);
    state = switch (result) {
      Success<List<Movie>>(:final value) => AsyncData(value),
      Failure<List<Movie>>() => AsyncError(Exception('Erro ao buscar filmes por genero'), StackTrace.current),
    };
  }
}
