// apikey: 3ad6e9d1c10e2bb05118f28bfcf85829 (dlira: me cree mi cuenta en tmdb en la seccion de developers y es la que usaremos)
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dlira_peliculas/models/movie.dart';
import 'package:dlira_peliculas/models/top_movies.dart';
import 'package:dlira_peliculas/models/trending_movies.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '3ad6e9d1c10e2bb05118f28bfcf85829';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> topMovies = [];
  List<Movie> trendingMovies = [];

  MoviesProvider() {
    getTopRatedMovies();
    getTrendingMovies();
  }

  Future<String> _getJsonData(String endpoint) async {
    final url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'api_key': _apiKey,
        'language': _language,
      },
    );

    final response = await http.get(url);
    return response.body;
  }
  //endpoints
  Future<void> getTopRatedMovies() async {
    final jsonData = await _getJsonData('/3/movie/top_rated'); // este todavia no se si lo usaremos

    final resp = TopMovies.fromJson(jsonData);
    topMovies = resp.movies;

    notifyListeners();
  }
  Future<void> getTrendingMovies() async {
    final jsonData = await _getJsonData('/3/trending/movie/week');

    final resp = TrendingMovies.fromJson(jsonData);
    trendingMovies = resp.movies;

    notifyListeners();
  }
}

