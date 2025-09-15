import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:cinebox/ui/movie_detail/commands/get_movie_details_command.dart';
import 'package:cinebox/ui/movie_detail/movie_detail_view_model.dart';
import 'package:cinebox/ui/movie_detail/widgets/cast_box.dart';
import 'package:cinebox/ui/movie_detail/widgets/movie_trailer.dart';
import 'package:cinebox/ui/movie_detail/widgets/rating_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailScreen extends ConsumerStatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends ConsumerState<MovieDetailScreen> with LoaderAndMessage {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieId = ModalRoute.of(context)?.settings.arguments as int?;
      if (movieId == null) {
        showErrorSnackBar('ID do filme não encontrado');
        Navigator.pop(context);
        return;
      }

      ref.read(movieDetailViewModelProvider).fetchMovieDetails(movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final movieDetail = ref.watch(getMovieDetailsCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do filme'),
      ),
      body: movieDetail.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Erro ao carregar detalhes do filme'),
        ),
        data: (data) {
          if (data == null) {
            return Center(
              child: Text('Filme não encontrado'),
            );
          }
          final hoursRuntime = data.runtime ~/ 60;
          final minutesRuntime = data.runtime % 60;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 24,
              children: [
                SizedBox(
                  height: 278,
                  child: ListView.builder(
                    itemCount: data.images.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),

                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: data.images[index],
                          placeholder: (context, url) => Container(
                            height: 160,
                            color: AppColors.lightGrey,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text(
                        data.title,
                        style: AppTextStyles.titleLarge,
                      ),
                      RatingStars(
                        starCount: 5,
                        starColor: AppColors.yellow,
                        starSize: 14,
                        value: data.voteAverage / 2,
                        valueLabelVisibility: false,
                        valueLabelPadding: EdgeInsets.zero,
                        valueLabelMargin: EdgeInsets.zero,
                      ),
                      Text(
                        data.genres.map((g) => g.name).join(', '),
                        style: AppTextStyles.lightGreyRegular,
                      ),
                      Text(
                        '${DateTime.parse(data.releaseDate).year} | ${hoursRuntime}h$minutesRuntime',
                        style: AppTextStyles.regularSmall,
                      ),
                      Text(
                        'O Coringa é um vilão complexo da DC Comics, arqui-inimigo do Batman, conhecido por sua inteligência genial, senso de humor cruel e aparência de palhaço, que utiliza química e improvisação para semear o caos na cidade de Gotham e manipular as pessoas. Sua personalidade anarquista e psicopata, que encontra prazer na desgraça alheia, o torna um dos mais famosos e icónicos vilões dos quadrinhos, representando o conflito entre ordem e caos.',
                        style: AppTextStyles.regularSmall,
                      ),
                      CastBox(),
                      MovieTrailer(),
                      const SizedBox(
                        height: 30,
                      ),
                      RatingPanel(
                        voteAverage: 20,
                        voteCount: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
