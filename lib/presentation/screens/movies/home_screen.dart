import 'package:flutter/material.dart';

import 'package:watchmovies/constants/environment.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-movies';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(Environment.theMovieDbKey),
    ));
  }
}
