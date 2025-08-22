import 'package:cinebox/data/models/movie_response.dart';
import 'package:cinebox/domain/models/movie.dart';

class MovieMappers {
  static List<Movie> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (response) => Movie(
            id: response.id,
            title: response.title,
            overview: response.overview,
            genreIds: response.genreIds ?? [],
            voteAverage: response.voteAverage,
            backdropPath: response.backdropPath,
            posterPath: response.posterPath,
            releaseDate: response.releaseDate,
          ),
        )
        .toList();
  }
}
