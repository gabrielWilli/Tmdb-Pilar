import 'package:go_router/go_router.dart';
import 'package:tmdb_pilar/core/utils/enum/routes_enum.dart';
import 'package:tmdb_pilar/presentation/details/view/details_page.dart';
import 'package:tmdb_pilar/presentation/navigation/view/navigation_page.dart';

final GoRouter router = GoRouter(
  initialLocation: RoutesEnum.navigation.path,
  routes: [
    GoRoute(
      name: RoutesEnum.navigation.name,
      path: RoutesEnum.navigation.path,
      builder: (_, __) => const NavigationPage(),
    ),
    GoRoute(
      name: RoutesEnum.details.name,
      path: RoutesEnum.details.path,
      builder: (_, GoRouterState state) {
        final movieId = (state.extra as int);

        return DetailsPage(movieId: movieId);
      },
    ),
  ],
);
