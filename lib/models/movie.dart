// ignore_for_file: non_constant_identifier_names

class Movie {
  final String id;
  final String title;
  final String director;
  final String release_date;
  final String image;

  Movie(
      {required this.id,
      required this.title,
      required this.director,
      required this.release_date,
      required this.image});

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
        id: parsedJson['id'],
        title: parsedJson['title'],
        director: parsedJson['director'],
        release_date: parsedJson['release_date'],
        image: parsedJson['image']);
  }
}
