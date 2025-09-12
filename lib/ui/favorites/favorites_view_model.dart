import 'package:cinebox/ui/favorites/commands/get_favorite_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_view_model.g.dart';

class FavoritesViewModel {
  final GetFavoriteCommand _getFavoriteCommand;

  FavoritesViewModel({required GetFavoriteCommand getFavoriteCommand}) : _getFavoriteCommand = getFavoriteCommand;

  Future<void> fetchFavorites() => _getFavoriteCommand.execute();
}

@riverpod
FavoritesViewModel favoritesViewModel(Ref ref) {
  return FavoritesViewModel(getFavoriteCommand: ref.read(getFavoriteCommandProvider.notifier));
}
