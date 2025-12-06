import 'package:flutter/material.dart';
import 'package:dlira_peliculas/screens/screens.dart';


class AppRoutes {
  static const initialRoute = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    '/home': (_) => const HomeScreen(),
    '/details': (_) => const DetailsScreen(),
    '/info': (_) => const InfoScreen(),
  };
}
