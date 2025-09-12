import 'package:cinebox/data/repositories/movies/movies_repository.dart';
import 'package:cinebox/data/repositories/repositories_providers.dart';
import 'package:cinebox/ui/favorites/commands/get_favorite_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_view_model.g.dart';

class FavoritesViewModel {
  final GetFavoriteCommand _getFavoriteCommand;
  final MoviesRepository _moviesRepository;

  FavoritesViewModel({required GetFavoriteCommand getFavoriteCommand, required MoviesRepository moviesRepository})
    : _getFavoriteCommand = getFavoriteCommand,
      _moviesRepository = moviesRepository;

  Future<void> fetchFavorites() => _getFavoriteCommand.execute();
  Future<void> deleteFavoriteMovie(int movieId) async {
    await _moviesRepository.deleteFavoriteMovie(movieId);
    fetchFavorites();
  }
}

@riverpod
FavoritesViewModel favoritesViewModel(Ref ref) {
  return FavoritesViewModel(
    getFavoriteCommand: ref.read(getFavoriteCommandProvider.notifier),
    moviesRepository: ref.read(moviesRepositoryProvider),
  );
}
