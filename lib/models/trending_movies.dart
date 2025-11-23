import 'dart:convert';
import 'movie.dart';

class TrendingMovies {
  final int page;
  final List<Movie> movies;

  TrendingMovies({
    required this.page,
    required this.movies,
  });

  factory TrendingMovies.fromJson(String str) =>
      TrendingMovies.fromMap(json.decode(str));

  factory TrendingMovies.fromMap(Map<String, dynamic> json) => TrendingMovies(
        page: json["page"] ?? 1,
        movies: json["results"] == null
            ? []
            : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
      );
}
