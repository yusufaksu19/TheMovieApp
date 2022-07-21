import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  String apiKey = "35ef0461fc4557cf1d256d3335ed7545";
  String url = "https://api.themoviedb.org/3";

  // Search for movies
  Future searchMovies(String movieTitle, int pageNumber) async {
    var response = await http.get(
      Uri.parse('$url/search/movie?api_key=$apiKey&query=$movieTitle&language=en-US&page=$pageNumber&include_adult=false'),
      headers: {'Content-Type': 'application/json'},
    );

    print('searchMovies status code = ${response.statusCode}');
    print('searchMovies status code = ${response.body}');

    return returnResponse(response);
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
