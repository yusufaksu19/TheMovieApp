import 'package:flutter/material.dart';
import 'package:the_movie_app/enums/enums.dart';
import 'package:the_movie_app/models/movie_details_model.dart';
import 'package:the_movie_app/services/api_services.dart';

class MovieDetailsViewModel with ChangeNotifier {
  LoadingStatus _loadingStatus = LoadingStatus.initial;

  late MovieDetailsModel _movieDetails;

  MovieDetailsModel get movieDetails => _movieDetails;

  set loadingStatus(LoadingStatus value) {
    _loadingStatus = value;
    notifyListeners();
  }

  LoadingStatus get loadingStatus => _loadingStatus;

  Future<void> getMovieDetails(int movieId) async {
    loadingStatus = LoadingStatus.loading;
    try {
      _movieDetails = await ApiServices().getMovieDetails(movieId);

      loadingStatus = LoadingStatus.completed;
    } catch (e) {
      print('catch $e');

      loadingStatus = LoadingStatus.error;
    }
    print(loadingStatus);
  }
}
