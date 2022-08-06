import 'package:http/http.dart' as http;
import 'package:the_movie_app/models/movie_details_model.dart';
import 'dart:convert';
import 'package:the_movie_app/models/movie_model.dart';

class ApiServices {
  String apiKey = "35ef0461fc4557cf1d256d3335ed7545";
  String url = "https://api.themoviedb.org/3";

  // Search for movies
  Future<MovieModel> searchMovies(String movieTitle, int pageNumber) async {
    var response = await http.get(
      Uri.parse('$url/search/movie?api_key=$apiKey&query=$movieTitle&language=en-US&page=$pageNumber&include_adult=false'),
      headers: {'Content-Type': 'application/json'},
    );

    return MovieModel.fromJson(returnResponse(response));
  }

  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    var response = await http.get(
      Uri.parse('$url/movie/$movieId?api_key=$apiKey&&language=en-US'),
      headers: {'Content-Type': 'application/json'},
    );

    return MovieDetailsModel.fromJson(returnResponse(response));
  }

  // Request feedbacks
  returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      default:
        throw 'Error Loading Data';
    }
  }
}
