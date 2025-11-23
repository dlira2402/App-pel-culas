import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dlira_peliculas/api/movie_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    final movies = moviesProvider.trendingMovies;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pruebita',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),

      backgroundColor: const Color(0xFF0D0D0D),
      //                         |
      // dlira TODO: Separar todo esto v en widgets aparte para reutilizarlos
      body: movies.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/details',
                      arguments: movie,
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FadeInImage(
                      placeholder: const AssetImage(''),
                      image: NetworkImage(movie.fullPosterImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
