import 'package:flutter/material.dart';
import 'movies_list.dart';

void main() {
  runApp(const MyMovies());
}

class MyMovies extends StatelessWidget {
  const MyMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Les filmes ghibli",
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const MoviesList(),
    );
  }
}
