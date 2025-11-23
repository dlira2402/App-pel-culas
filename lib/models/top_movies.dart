import 'dart:convert';
import 'package:dlira_peliculas/models/movie.dart';

class TopMovies {
  final int page;
  final List<Movie> movies;
  final int totalPages;
  final int totalResults;

  TopMovies({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory TopMovies.fromJson(String str) =>
      TopMovies.fromMap(json.decode(str));

  factory TopMovies.fromMap(Map<String, dynamic> json) =>
      TopMovies(
        page: json["page"],
        movies: List<Movie>.from(
          json["results"].map((x) => Movie.fromMap(x)),
        ),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
