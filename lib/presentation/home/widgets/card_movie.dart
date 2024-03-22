import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_pilar/core/utils/constants/constants.dart';
import 'package:tmdb_pilar/core/utils/extensions/percent_vote_extension.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/presentation/home/widgets/outer_ring.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    super.key,
    required this.movieEntity,
    required this.onPressed,
    this.visiblePercent = true,
  });

  final MovieEntity movieEntity;
  final VoidCallback onPressed;
  final bool visiblePercent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: 153,
                  height: 231,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: movieEntity.posterPath,
                    ),
                  ),
                ),
                visiblePercent
                    ? Positioned(
                        bottom: -20,
                        left: 8,
                        child: OuterRing(
                          percent: movieEntity.voteAverage.percentVote(),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 153,
              child: Text(
                movieEntity.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontFamily: sourceSansPro,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
