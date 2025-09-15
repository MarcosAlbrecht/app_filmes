import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:cinebox/ui/movie_detail/widgets/actor_card.dart';
import 'package:flutter/material.dart';

class CastBox extends StatelessWidget {
  const CastBox({super.key});

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
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ActorCard(
                  imageUrl:
                      'https://conteudo.imguol.com.br/c/entretenimento/38/2019/10/16/o-coringa-de-rousseau-o-homem-nasce-livre-e-por-toda-a-parte-encontra-se-a-ferros-1571252808188_v2_900x506.jpg',
                  name: 'Marcos R. Albrecht',
                  character: 'Coringa',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
