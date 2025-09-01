import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/services/movies/movies_service.dart';
import 'package:cinebox/domain/models/favorite_movie.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesService _moviesService;

  MoviesRepositoryImpl({required MoviesService moviesService}) : _moviesService = moviesService;
  @override
  Future<Result<List<FavoriteMovie>>> getMyFavoritesMovies() async {
    try {
      final response = await _moviesService.getMyFavoritesMovies();
      final favorites = response
          .map(
            (f) => FavoriteMovie(
              id: f.movieId,
              posterPath: f.posterUrl,
              title: f.title,
              year: f.year,
            ),
          )
          .toList();
      return Success(favorites);
    } on Exception catch (e, s) {
      log('Erro ao buscar os filmes favoritos', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao buscar os filmes favoritos'));
    }
  }
}
