import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:dlira_peliculas/routes/app_routes.dart';
import 'package:dlira_peliculas/api/movie_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Peliculas | Daniel Lira',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
