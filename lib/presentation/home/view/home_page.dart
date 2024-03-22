import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_pilar/di/di.dart';
import 'package:tmdb_pilar/presentation/home/bloc/popular/popular_bloc.dart';
import 'package:tmdb_pilar/presentation/home/bloc/popular/popular_event.dart';
import 'package:tmdb_pilar/presentation/home/bloc/top_rated/top_rated_bloc.dart';
import 'package:tmdb_pilar/presentation/home/bloc/top_rated/top_rated_event.dart';
import 'package:tmdb_pilar/presentation/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularBloc>(
          create: (_) => getIt<PopularBloc>()..add(GetListPopularEvent()),
        ),
        BlocProvider<TopRatedBloc>(
          create: (_) => getIt<TopRatedBloc>()..add(GetListTopRatedEvent()),
        ),
      ],
      child: const HomeView(),
    );
  }
}
