import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:cinebox/domain/usescases/usescases_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_movies_by_name_command.g.dart';

@riverpod
class SearchMoviesByNameCommand extends _$SearchMoviesByNameCommand {
  @override
  AsyncValue<List<Movie>> build() => AsyncLoading();

  Future<void> execute(String name) async {
    state = AsyncLoading();
    final searchMoviesUC = ref.read(getMoviesByNameUsecaseProvider);
    final moviesResult = await searchMoviesUC.execute(name: name);
    state = switch (moviesResult) {
      Success<List<Movie>>(:final value) => AsyncData(value),
      Failure() => AsyncError('Erro ao buscar filmes', StackTrace.current),
    };
  }
}
