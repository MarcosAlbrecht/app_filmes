import 'package:cinebox/config/env.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tmdb_rest_client_provider.g.dart';

@Riverpod(keepAlive: true)
Dio tmdbRestClientDio(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
    ),
  );

  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Authorization'] = 'Berar ${Env.theMovieDbApiKey}';
  dio.interceptors.addAll([
    LogInterceptor(
      request: true,
      requestHeader: true,
      responseBody: true,
      requestBody: true,
      error: true,
    ),
  ]);

  return dio;
}
