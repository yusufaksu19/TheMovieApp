import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_app/view_models/movie_search_view_model.dart';

class MovieCard extends StatelessWidget {
  final int index;
  const MovieCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieSearchViewModel movieSearchViewModel = Provider.of<MovieSearchViewModel>(context);

    String movieTitle = movieSearchViewModel.moviesPage.results[index].originalTitle;
    String voteAverage = movieSearchViewModel.moviesPage.results[index].voteAverage.toString();
    String posterImage = movieSearchViewModel.moviesPage.results[index].posterPath;

    String posterUrl = "https://www.themoviedb.org/t/p/w1280";

    return Container(
      margin: const EdgeInsets.all(6),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // Movie Picture
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Image.network('$posterUrl$posterImage'),
              ),
              // Movie point
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  bottom: 5,
                ),
                height: MediaQuery.of(context).size.height * 0.03,
                width: MediaQuery.of(context).size.width * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: Text(voteAverage),
                ),
              ),
            ],
          ),
          // Movie title
          Container(
            height: MediaQuery.of(context).size.height * 0.03,
            width: MediaQuery.of(context).size.width * 0.30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(),
              border: Border.all(
                color: Colors.black,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 3, top: 3),
              child: Text(movieTitle),
            ),
          ),
        ],
      ),
    );
  }
}