import 'package:flutter/material.dart';
import 'package:the_movie_app/enums/enums.dart';
import 'package:the_movie_app/models/movie_model.dart';
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

  // to keep page changes
  int _nextPage = 1;
  int get nextPage => _nextPage;

  set nextPage(int value) {
    _nextPage = value;
    notifyListeners();
  }

  Future<void> searchMovies(String movieTitle, int pageNumber) async {
    loadingStatus = LoadingStatus.loading;
    try {
      _moviesPage = await ApiServices().searchMovies(movieTitle, pageNumber);

      loadingStatus = LoadingStatus.completed;
    } catch (e) {
      print('catch $e');

      loadingStatus = LoadingStatus.error;
    }
    print(loadingStatus);
  }
}
