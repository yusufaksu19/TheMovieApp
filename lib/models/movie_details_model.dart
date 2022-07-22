import 'dart:convert';

MovieDetailsModel movieDetailsModelFromJson(String str) => MovieDetailsModel.fromJson(json.decode(str));

class MovieDetailsModel {
  MovieDetailsModel({
    required this.id,
    required this.originalTitle,
    required this.overview,
    required this.backdropPath,
    required this.genres,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  final int id;
  final String originalTitle;
  final String overview;
  final List<Genre> genres;
  final String backdropPath;
  final String posterPath;
  final String title;
  final dynamic voteAverage;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
        id: json["id"] ?? 0,
        backdropPath: json["backdrop_path"] ?? 'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
        overview: json["overview"] ?? '',
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        originalTitle: json["original_title"] ?? '',
        posterPath: json["poster_path"] ?? 'https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg',
        voteAverage: json["vote_average"] ?? 0,
        title: json["title"] ?? '',
      );
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
      );
}
