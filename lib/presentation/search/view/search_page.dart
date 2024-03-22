import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_pilar/di/di.dart';
import 'package:tmdb_pilar/presentation/search/bloc/search_bloc.dart';
import 'package:tmdb_pilar/presentation/search/view/search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<SearchBloc>(
            create: (context) => getIt<SearchBloc>(),
          ),
        ],
        child: const SearchView(),
      );
}
