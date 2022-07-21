import 'package:flutter/material.dart';
import 'package:the_movie_app/enums/enums.dart';
import 'package:the_movie_app/models/MovieModel.dart';
import 'package:the_movie_app/services/api_services.dart';

class MovieSearchViewModel with ChangeNotifier {
  LoadingStatus _loadingStatus = LoadingStatus.initial;

  late MovieModel _moviesPage;

  MovieModel get moviesPage => _moviesPage;

  set loadingStatus(LoadingStatus value) {
    _loadingStatus = value;
    notifyListeners();
  }

  LoadingStatus get loadingStatus => _loadingStatus;

  Future<void> searchMovies(String movieTitle, int pageNumber) async {
    try {
      _loadingStatus = LoadingStatus.loading;

      _moviesPage = await ApiServices().searchMovies(movieTitle, pageNumber);

      loadingStatus = LoadingStatus.completed;
    } catch (e) {
      print('catch $e');

      loadingStatus = LoadingStatus.error;
    }
    print(loadingStatus);
  }
}
