// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:ghibli/detail_movie.dart';
import 'package:ghibli/models/movie.dart';
import 'package:ghibli/utils/helper.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  int moviesCount = 0;
  List<Movie> movies = [];
  HttpHelper helper = HttpHelper();

  @override
  void initState() {
    super.initState();
    helper = HttpHelper();
    initialize();
  }

  Future initialize() async {
    movies = (await helper.getFilms())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies Ghibli"),
      ),
      body: ListView.builder(
          itemCount: (moviesCount) == null ? 0 : moviesCount,
          itemBuilder: (BuildContext context, int pos) {
            final movie = movies[pos];
            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 4, 15, 0),
              child: Card(
                color: Colors.greenAccent,
                elevation: 7,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                        width: 150,
                        height: 250,
                        child: Container(
                          color: Colors.white,
                          child: Image.network(
                            movie.image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 35),
                            ),
                            Text(
                              movie.director + " " + movie.release_date,
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 50,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return DetailMovie(movieId: movie.id);
                              },
                            ),
                          );
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }
}
