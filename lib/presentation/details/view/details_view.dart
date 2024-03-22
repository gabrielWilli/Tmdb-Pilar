import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_pilar/core/bloc_state/bloc_state.dart';
import 'package:tmdb_pilar/core/utils/constants/constants.dart';
import 'package:tmdb_pilar/core/utils/extensions/percent_vote_extension.dart';
import 'package:tmdb_pilar/domain/entities/cast_entity.dart';
import 'package:tmdb_pilar/domain/entities/movie_details_entity.dart';
import 'package:tmdb_pilar/presentation/details/bloc/cast/cast_bloc.dart';
import 'package:tmdb_pilar/presentation/details/bloc/details/details_bloc.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({
    super.key,
  });

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  late DetailsBloc _detailsBloc;
  late CastBloc _castBloc;

  @override
  void initState() {
    super.initState();

    _detailsBloc = BlocProvider.of<DetailsBloc>(context);
    _castBloc = BlocProvider.of<CastBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<DetailsBloc, BlocState>(
        bloc: _detailsBloc,
        builder: (context, state) {
          return switch (state) {
            BlocStateLoading() => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            BlocStateSuccess<MovieDetailsEntity>() => CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 400,
                    automaticallyImplyLeading: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: state.value!.posterPath,
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            child: Text(
                              state.value!.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: sourceSansPro,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${state.value!.voteAverage.percentVote().toString()} %",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: state.value!.voteAverage < 5.0
                                  ? Colors.red
                                  : Colors.green,
                              fontFamily: sourceSansPro,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        state.value!.formatReleaseDate(),
                        style: const TextStyle(
                          fontFamily: sourceSansPro,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: Text(
                        state.value!.overview,
                        style: const TextStyle(
                          fontFamily: sourceSansPro,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  BlocBuilder<CastBloc, BlocState>(
                    bloc: _castBloc,
                    builder: (context, state) {
                      return switch (state) {
                        BlocStateLoading() => const SliverToBoxAdapter(
                            child: CircularProgressIndicator.adaptive()),
                        BlocStateEmpty() => const SliverToBoxAdapter(
                            child: Text('Lista vazia'),
                          ),
                        BlocStateSuccess<List<CastEntity>>() =>
                          SliverToBoxAdapter(
                            child: SizedBox(
                              height: 150,
                              child: ListView.separated(
                                itemCount: state.value!.length,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                scrollDirection: Axis.horizontal,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 8),
                                itemBuilder: (context, index) => SizedBox(
                                  width: 100,
                                  height: 150,
                                  child: CachedNetworkImage(
                                    fit: BoxFit.fill,
                                    imageUrl: state.value![index].profilePath!,
                                    errorWidget: (_, __, ___) =>
                                        const Placeholder(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        _ => const SliverToBoxAdapter(child: Text('Erro!')),
                      };
                    },
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                ],
              ),
            _ => const Text('Erro!'),
          };
        },
      ),
    );
  }
}
