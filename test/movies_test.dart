// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

import 'package:the_movie_app/main.dart';
import 'package:the_movie_app/models/movie_details_model.dart';
import 'package:the_movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

import 'test_resources/api_provider.dart';

void main() {
  test('test 1 - MovieModel Class Should Get The Following Data', () {
    // The model should be able to receive the following data:
    final movie = MovieModel(
      page: 0,
      results: [],
      totalPages: 0,
      totalResults: 0,
    );

    expect(movie.page, 0);
    expect(movie.results, []);
    expect(movie.totalPages, 0);
    expect(movie.totalResults, 0);
  });

  test('test 2 - MovieDetailsModel Class Should Get The Following Data', () {
    // The model should be able to receive the following data:
    final movieDetails = MovieDetailsModel(
      id: 0,
      originalTitle: '',
      overview: '',
      backdropPath: '',
      genres: [],
      posterPath: '',
      title: '',
      voteAverage: 0,
    );

    expect(movieDetails.id, 0);
    expect(movieDetails.originalTitle, '');
    expect(movieDetails.overview, '');
    expect(movieDetails.backdropPath, '');
    expect(movieDetails.genres, []);
    expect(movieDetails.posterPath, '');
    expect(movieDetails.title, '');
    expect(movieDetails.voteAverage, 0);
  });

  test('test 3 - searchMovies mock data test', () {
    final file = File('test/test_resources/search_movies.json').readAsStringSync();
    final movie = MovieModel.fromJson(jsonDecode(file) as Map<String, dynamic>);

    expect(movie.page, 1);

    expect(movie.results[0].id, 634649);
    expect(movie.results[0].originalTitle, "Spider-Man: No Way Home");
    expect(movie.results[0].posterPath, "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg");
    expect(movie.results[0].title, "Spider-Man: No Way Home");
    expect(movie.results[0].backdropPath, "/q9wnyYMAyKhOvfycUERFNKTHEaL.jpg");
    expect(movie.results[0].voteAverage, 8.1);

    expect(movie.totalPages, 170);
    expect(movie.totalResults, 3387);
  });

  test('test 4 - movieDetails mock data test', () {
    final file = File('test/test_resources/movie_details.json').readAsStringSync();
    final movieDetails = MovieDetailsModel.fromJson(jsonDecode(file) as Map<String, dynamic>);

    expect(movieDetails.id, 615469);
    expect(movieDetails.originalTitle, "Spiderhead");
    expect(movieDetails.backdropPath, "/ulkWS7Atv0vv33KVCSAmNizAmJd.jpg");

    expect(movieDetails.genres[0].id, 878);
    expect(movieDetails.genres[0].name, "Science Fiction");

    expect(movieDetails.overview,
        "A prisoner in a state-of-the-art penitentiary begins to question the purpose of the emotion-controlling drugs he's testing for a pharmaceutical genius.");
    expect(movieDetails.posterPath, "/5hTK0J9SGPLSTFwcbU0ELlJsnAY.jpg");
    expect(movieDetails.title, "Spiderhead");
    expect(movieDetails.voteAverage, 5.7);
  });

  test('test 5 - searchMovies mock http request ', () async {
    Future<http.Response> _mockRequest(http.Request request) async {
      if (request.url.toString().startsWith('https://api.themoviedb.org/3/search/movie')) {
        return http.Response(File('test/test_resources/search_movies.json').readAsStringSync(), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        });
      }
      return http.Response('Error: Unknown endpoint', 404);
    }

    final apiProvider = ApiProvider(MockClient(_mockRequest));
    final movie = await apiProvider.getSearchMovies();
    expect(movie.page, 1);

    expect(movie.results[0].id, 634649);
    expect(movie.results[0].originalTitle, "Spider-Man: No Way Home");
    expect(movie.results[0].posterPath, "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg");
    expect(movie.results[0].title, "Spider-Man: No Way Home");
    expect(movie.results[0].backdropPath, "/q9wnyYMAyKhOvfycUERFNKTHEaL.jpg");
    expect(movie.results[0].voteAverage, 8.1);

    expect(movie.totalPages, 170);
    expect(movie.totalResults, 3387);
  });

  test('test 6 - movieDetails mock http request', () async {
    Future<http.Response> _mockRequest(http.Request request) async {
      if (request.url.toString().startsWith('https://api.themoviedb.org/3/movie/615469')) {
        return http.Response(File('test/test_resources/movie_details.json').readAsStringSync(), 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        });
      }
      return http.Response('Error: Unknown endpoint', 404);
    }

    final apiProvider = ApiProvider(MockClient(_mockRequest));
    final movieDetails = await apiProvider.getMovieDetails();

    expect(movieDetails.id, 615469);
    expect(movieDetails.originalTitle, "Spiderhead");
    expect(movieDetails.backdropPath, "/ulkWS7Atv0vv33KVCSAmNizAmJd.jpg");

    expect(movieDetails.genres[0].id, 878);
    expect(movieDetails.genres[0].name, "Science Fiction");

    expect(movieDetails.overview,
        "A prisoner in a state-of-the-art penitentiary begins to question the purpose of the emotion-controlling drugs he's testing for a pharmaceutical genius.");
    expect(movieDetails.posterPath, "/5hTK0J9SGPLSTFwcbU0ELlJsnAY.jpg");
    expect(movieDetails.title, "Spiderhead");
    expect(movieDetails.voteAverage, 5.7);
  });
}
