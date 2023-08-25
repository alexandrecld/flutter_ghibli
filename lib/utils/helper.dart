import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ghibli/models/movie.dart';

class HttpHelper {
  final String urlBase = "https://ghibliapi.vercel.app";
  final String urlMethod = "/films";

  Future<List<Movie>?> getFilms() async {
    final String ghibli = urlBase + urlMethod;
    http.Response result = await http.get(Uri.parse(ghibli));

    if (result.statusCode == HttpStatus.ok) {
      final responseBody = jsonDecode(result.body).cast<Map<String, dynamic>>();
      List<Movie> movies =
          responseBody.map<Movie>((el) => Movie.fromJson(el)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<Movie?> getFilm(String id) async {
    final String ghibli = urlBase + urlMethod;
    http.Response result = await http.get(Uri.parse("$ghibli/$id"));

    if (kDebugMode) {
      print(result.statusCode);
    }
    if (result.statusCode == HttpStatus.ok) {
      final responseBody = jsonDecode(result.body);
      if (kDebugMode) {
        print(responseBody);
      }
      return Movie.fromJson(responseBody);
    } else {
      throw Exception("echec de la lecture du json");
    }
  }
}
