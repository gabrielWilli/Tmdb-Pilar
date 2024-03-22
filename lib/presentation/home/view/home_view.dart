import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tmdb_pilar/core/bloc_state/bloc_state.dart';
import 'package:tmdb_pilar/core/utils/constants/constants.dart';
import 'package:tmdb_pilar/core/utils/enum/routes_enum.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/presentation/home/bloc/popular/popular_bloc.dart';
import 'package:tmdb_pilar/presentation/home/bloc/top_rated/top_rated_bloc.dart';
import 'package:tmdb_pilar/presentation/home/widgets/card_movie.dart';
import 'package:tmdb_pilar/presentation/home/widgets/empty.dart';
import 'package:tmdb_pilar/presentation/home/widgets/loading.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PopularBloc _popularBloc;
  late TopRatedBloc _topRatedBloc;

  @override
  void initState() {
    super.initState();

    _popularBloc = BlocProvider.of<PopularBloc>(context);
    _topRatedBloc = BlocProvider.of<TopRatedBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color(0XFF0D253F),
            bottom: PreferredSize(
              preferredSize: const Size(0, 0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: SvgPicture.asset(
                  'assets/images/logo_blue_long.svg',
                ),
              ),
            ),
            toolbarHeight: 70,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverMainAxisGroup(
              slivers: [
                const SliverToBoxAdapter(
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: sourceSansPro,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                BlocBuilder<PopularBloc, BlocState>(
                  bloc: _popularBloc,
                  builder: (context, state) {
                    return switch (state) {
                      BlocStateEmpty() => const Empty(),
                      BlocStateLoading() => const Loading(),
                      BlocStateSuccess<List<MovieEntity>>() =>
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 274,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.value!.length,
                              itemBuilder: (context, index) => CardMovie(
                                movieEntity: state.value![index],
                                onPressed: () {
                                  context.pushNamed(
                                    RoutesEnum.details.name,
                                    extra: state.value![index].id,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      _ => const SliverToBoxAdapter(
                          child: SizedBox(height: 274),
                        ),
                    };
                  },
                )
              ],
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverMainAxisGroup(
              slivers: [
                const SliverToBoxAdapter(
                    child: Text(
                  'Top Rated',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: sourceSansPro,
                    fontWeight: FontWeight.w600,
                  ),
                )),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                BlocBuilder<TopRatedBloc, BlocState>(
                  bloc: _topRatedBloc,
                  builder: (context, state) {
                    return switch (state) {
                      BlocStateEmpty() => const Empty(),
                      BlocStateLoading() => const Loading(),
                      BlocStateSuccess<List<MovieEntity>>() =>
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 274,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.value!.length,
                              itemBuilder: (context, index) => CardMovie(
                                movieEntity: state.value![index],
                                onPressed: () {
                                  context.pushNamed(
                                    RoutesEnum.details.name,
                                    extra: state.value![index].id,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      _ => const SliverToBoxAdapter(
                          child: SizedBox(height: 274),
                        ),
                    };
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
