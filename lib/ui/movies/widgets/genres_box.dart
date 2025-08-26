import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/movies/widgets/commands/get_genres_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenresBox extends ConsumerWidget {
  final selectedGenre = ValueNotifier(0);

  GenresBox({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genres = ref.watch(getGenresCommandProvider);
    return genres.when(
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stackTrace) => Center(
        child: Text('Erro ao buscar generos'),
      ),
      data: (data) {
        return SizedBox(
          height: 25,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 16),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              final genre = data[index];
              return InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  selectedGenre.value = genre.id;
                },
                child: ValueListenableBuilder(
                  valueListenable: selectedGenre,
                  builder: (_, value, _) {
                    return Container(
                      margin: EdgeInsets.only(right: 8),
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: value == genre.id ? AppColors.redColor : AppColors.darkGrey,
                      ),
                      child: Center(
                        child: Text(
                          genre.name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
