import 'dart:convert';

MovieModel movieModelFromJson(String str) => MovieModel.fromJson(json.decode(str));

class MovieModel {
  MovieModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        page: json["page"] ?? 0,
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"] ?? 0,
        totalResults: json["total_results"] ?? 0,
      );
}

class Result {
  Result({
    required this.backdropPath,
    required this.id,
    required this.originalTitle,
    required this.posterPath,
    required this.title,
  });

  final String backdropPath;
  final int id;
  final String originalTitle;
  final String posterPath;
  final String title;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] ?? 0,
        backdropPath: json["backdrop_path"] ?? "https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg",
        originalTitle: json["original_title"] ?? "",
        posterPath: json["poster_path"] ?? "https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg",
        title: json["title"] ?? "",
      );
}
