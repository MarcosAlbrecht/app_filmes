import 'package:cinebox/ui/movies/widgets/commands/get_movies_by_category_command.dart';
import 'package:cinebox/ui/movies/widgets/movies_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesByCategory extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(getMoviesByCategoryCommandProvider);
    return movies.when(
      loading: () => Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Text('Erro ao buscar filmes'),
      ),
      data: (data) {
        if (data == null) {
          return Center(
            child: Text('Nenum filme encontrado'),
          );
        }

        return Container(
          margin: EdgeInsets.only(bottom: 130),
          child: Column(
            children: [
              MoviesBox(
                title: 'Mais populares',
                movies: data.popular,
              ),
              // MoviesBox(
              //   title: 'Top filmes',
              //   movies: [],
              // ),
            ],
          ),
        );
      },
    );
  }
}
