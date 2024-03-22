import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_pilar/core/bloc_state/bloc_state.dart';
import 'package:tmdb_pilar/domain/entities/movie_entity.dart';
import 'package:tmdb_pilar/presentation/home/widgets/card_movie.dart';
import 'package:tmdb_pilar/presentation/search/bloc/search_bloc.dart';
import 'package:tmdb_pilar/presentation/search/bloc/search_event.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late TextEditingController _textEditingController;
  late SearchBloc _searchBloc;

  String movieName = '';

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      movieName = _textEditingController.text;
    });

    _searchBloc = BlocProvider.of<SearchBloc>(context);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          backgroundColor: Color(0XFF0D253F),
          title: Text(
            'Search',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          toolbarHeight: 70,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: TextFormField(
              onEditingComplete: () =>
                  _searchBloc..add(GetFoundMovieEvent(movieName: movieName)),
              controller: _textEditingController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _textEditingController.text.isNotEmpty
                    ? GestureDetector(
                        onTap: () {
                          _textEditingController.text = '';
                          _searchBloc
                              .add(const GetFoundMovieEvent(movieName: ''));
                        },
                        child: const Icon(Icons.close))
                    : null,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        BlocBuilder(
          bloc: _searchBloc,
          builder: (context, state) {
            return switch (state) {
              BlocStateInitial() =>
                const SliverToBoxAdapter(child: SizedBox.shrink()),
              BlocStateEmpty() =>
                const SliverToBoxAdapter(child: SizedBox.shrink()),
              BlocStateLoading() => const SliverToBoxAdapter(
                    child: Center(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(),
                  ),
                )),
              BlocStateSuccess<List<MovieEntity>>() => SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 180.0,
                      mainAxisExtent: 274,
                    ),
                    itemBuilder: (context, index) => CardMovie(
                      movieEntity: state.value![index],
                      visiblePercent: false,
                      onPressed: () {},
                    ),
                    itemCount: state.value!.length,
                  ),
                ),
              _ => const SliverToBoxAdapter(child: Text('Erro!')),
            };
          },
        ),
      ],
    );
  }
}
