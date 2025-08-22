import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:cinebox/data/exceptions/data_exception.dart';
import 'package:cinebox/data/mappers/movie_mappers.dart';
import 'package:cinebox/data/repositories/tmdb/tmdb_repository.dart';
import 'package:cinebox/data/services/tmdb/tmdb_service.dart';
import 'package:cinebox/domain/models/movie.dart';
import 'package:dio/dio.dart';

class TmdbRepositoryImpl implements TmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepositoryImpl({required TmdbService tmdbService}) : _tmdbService = tmdbService;
  @override
  Future<Result<List<Movie>>> getPopularMovies({String language = 'pt-BR', int page = 1}) async {
    try {
      final moviesData = await _tmdbService.getPopularMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log('Erro ao buscar getPopularMovies', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao buscar os filmes populares'));
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlayingMovies({String language = 'pt-BR', int page = 1}) async {
    try {
      final moviesData = await _tmdbService.getNowPlayingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log('Erro ao buscar getNowPlayingMovies', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao buscar os filmes novos'));
    }
  }

  @override
  Future<Result<List<Movie>>> getTopRatedMovies({String language = 'pt-BR', int page = 1}) async {
    try {
      final moviesData = await _tmdbService.getTopRatedMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log('Erro ao buscar getTopRatedMovies', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao buscar os filmes top rated'));
    }
  }

  @override
  Future<Result<List<Movie>>> getUpComingMovies({String language = 'pt-BR', int page = 1}) async {
    try {
      final moviesData = await _tmdbService.getUpComingMovies(
        language: language,
        page: page,
      );

      return Success(MovieMappers.mapToMovies(moviesData));
    } on DioException catch (e, s) {
      log('Erro ao buscar getUpComingMovies', error: e, stackTrace: s);
      return Failure(DataException(message: 'Erro ao buscar os filmes novos'));
    }
  }
}
