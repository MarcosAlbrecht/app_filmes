import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/domain/usescases/get_movies_by_category_usecase.dart';
import 'package:cinebox/domain/usescases/get_movies_by_genre_usecase.dart';
import 'package:cinebox/domain/usescases/get_movies_by_name_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usescases_provider.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref) {
  return GetMoviesByCategoryUsecase(tmdbRepository: ref.read(tmdbRepositoryProvider));
}

@riverpod
GetMoviesByGenreUsecase getMoviesByGenreUsecase(Ref ref) {
  return GetMoviesByGenreUsecase(tmdbRepository: ref.read(tmdbRepositoryProvider));
}

@riverpod
GetMoviesByNameUsecase getMoviesByNameUsecase(Ref ref) =>
    GetMoviesByNameUsecase(tmdbRepository: ref.read(tmdbRepositoryProvider));
