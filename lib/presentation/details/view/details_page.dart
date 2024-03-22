import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_pilar/di/di.dart';
import 'package:tmdb_pilar/presentation/details/bloc/cast/cast_bloc.dart';
import 'package:tmdb_pilar/presentation/details/bloc/cast/cast_event.dart';
import 'package:tmdb_pilar/presentation/details/bloc/details/details_bloc.dart';
import 'package:tmdb_pilar/presentation/details/bloc/details/details_event.dart';
import 'package:tmdb_pilar/presentation/details/view/details_view.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<DetailsBloc>(
            create: (context) =>
                getIt<DetailsBloc>()..add(GetDetailsEvent(movieId: movieId)),
          ),
          BlocProvider<CastBloc>(
            create: (context) =>
                getIt<CastBloc>()..add(GetListCastEvent(movieId: movieId)),
          ),
        ],
        child: const DetailsView(),
      );
}
