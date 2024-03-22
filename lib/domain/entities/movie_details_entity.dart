import 'package:equatable/equatable.dart';

class MovieDetailsEntity extends Equatable {
  final bool isAdult;
  final String title;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String status;
  final double voteAverage;

  const MovieDetailsEntity({
    required this.isAdult,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.status,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        isAdult,
        title,
        overview,
        posterPath,
        releaseDate,
        status,
        voteAverage,
      ];

  double truncateVote() => voteAverage.truncateToDouble();

  String formatReleaseDate() {
    final List<String> releaseDateSplit = releaseDate.split('-');

    return '${releaseDateSplit[2]}/${releaseDateSplit[1]}/${releaseDateSplit[0]}';
  }
}
