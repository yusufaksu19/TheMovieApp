import 'package:http/http.dart' show Client;
import 'package:the_movie_app/models/movie_details_model.dart';
import 'dart:convert';

import 'package:the_movie_app/models/movie_model.dart';

class ApiProvider {
  final Client client;

  ApiProvider(this.client);

  Future<MovieModel> getSearchMovies() async {
    final response = await client.get(Uri.parse('https://api.themoviedb.org/3/search/movie'));
    return MovieModel.fromJson(jsonDecode(response.body));
  }

  Future<MovieDetailsModel> getMovieDetails() async {
    final response = await client.get(Uri.parse('https://api.themoviedb.org/3/movie/615469'));
    return MovieDetailsModel.fromJson(jsonDecode(response.body));
  }
}