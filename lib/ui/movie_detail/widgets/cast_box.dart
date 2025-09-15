// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cinebox/domain/models/movie_detail.dart';
import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widgets/actor_card.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  final MovieDetail movieDetail;
  const CastBox({
    super.key,
    required this.movieDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColors.lightGrey.withAlpha(25)),
      child: ExpansionTile(
        dense: true,
        tilePadding: EdgeInsets.only(left: 0, right: 0),
        title: Text(
          'Elenco',
          style: AppTextStyles.regularSmall,
        ),
        childrenPadding: EdgeInsets.symmetric(vertical: 10),
        children: [
          SizedBox(
            height: 150,

            child: ListView.builder(
              itemCount: movieDetail.cast.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final actor = movieDetail.cast[index];
                return ActorCard(
                  imageUrl: 'https://images.tmdb.org/t/p/w154/${actor.profilePath}',
                  name: actor.name,
                  character: actor.character,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
