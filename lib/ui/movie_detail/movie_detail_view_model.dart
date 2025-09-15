import 'package:cinebox/ui/movie_detail/commands/get_movie_details_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'movie_detail_view_model.g.dart';

class MovieDetailViewModel {
  final GetMovieDetailsCommand _getMovieDetailViewModelCommand;

  MovieDetailViewModel({required GetMovieDetailsCommand getMovieDetailViewModelCommand})
    : _getMovieDetailViewModelCommand = getMovieDetailViewModelCommand;

  Future<void> fetchMovieDetails(int movieId) async {
    _getMovieDetailViewModelCommand.execute(movieId);
  }
}

@riverpod
MovieDetailViewModel movieDetailViewModel(Ref ref) {
  return MovieDetailViewModel(getMovieDetailViewModelCommand: ref.read(getMovieDetailsCommandProvider.notifier));
}
