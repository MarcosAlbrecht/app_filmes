import 'package:cinebox/domain/models/movie.dart';

extension MarkFavoriteExtension on List<Movie> {
  List<Movie> markAsFavorite(List<int> favorites) {
    return map((m) {
      if (favorites.contains(m.id)) {
        return m.copyWith(isFavorite: true);
      }
      return m;
    }).toList();
  }
}
