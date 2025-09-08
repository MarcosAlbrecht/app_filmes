// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'save_favorite_movie.g.dart';

@JsonSerializable()
class SaveFavoriteMovie {
  final int movieId;
  final String postUrl;
  final String title;
  final int year;

  SaveFavoriteMovie({
    required this.movieId,
    required this.postUrl,
    required this.title,
    required this.year,
  });

  factory SaveFavoriteMovie.fromJson(Map<String, dynamic> json) => _$SaveFavoriteMovieFromJson(json);

  Map<String, dynamic> toJson() => _$SaveFavoriteMovieToJson(this);
}
