import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_app/view_models/movie_search_view_model.dart';
import 'package:the_movie_app/views/movie_details_page.dart';

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

    String getPosterImage() {
      String posterUrl = "https://www.themoviedb.org/t/p/w1280";
      String noImageUrl = "https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg";

      if (posterImage != "") {
        return "$posterUrl$posterImage";
      } else {
        return noImageUrl;
      }
    }

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => const MovieDetailsPage()));
      },
      child: Container(
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
                  child: Image.network(getPosterImage()),
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
      ),
    );
  }
}
