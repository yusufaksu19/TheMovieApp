import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_app/enums/enums.dart';
import 'package:the_movie_app/models/movie_details_model.dart';
import 'package:the_movie_app/view_models/movie_details_view_model.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;
  final String movieTitle;
  final String movieImage;
  final String voteAverage;
  const MovieDetailsPage({Key? key, required this.movieId, required this.movieTitle, required this.movieImage, required this.voteAverage}) : super(key: key);

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  void getMovieDetails(int movieId) async {
    MovieDetailsViewModel movieDetailsViewModel = Provider.of<MovieDetailsViewModel>(context, listen: false);
    await movieDetailsViewModel.getMovieDetails(movieId);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getMovieDetails(widget.movieId);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieDetailsViewModel movieDetailsViewModel = Provider.of<MovieDetailsViewModel>(context);

    String backdropPath = movieDetailsViewModel.movieDetails.backdropPath;

    String overview = movieDetailsViewModel.movieDetails.overview;
    List<Genre> genres = movieDetailsViewModel.movieDetails.genres;

    String allGenres = genres.map((e) => e.name).toList().join(",");

    String noImageUrl = "https://as1.ftcdn.net/v2/jpg/04/34/72/82/1000_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg";
    String url = "https://www.themoviedb.org/t/p/w1280";

    String getBackDropImage() {
      if (backdropPath != "") {
        return "$url$backdropPath";
      } else {
        return noImageUrl;
      }
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(widget.movieTitle),
        ),
        body: movieDetailsViewModel.loadingStatus == LoadingStatus.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  FractionallySizedBox(
                    heightFactor: 1.0,
                    widthFactor: 1.0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(getBackDropImage()),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                // Movie Picture
                                Container(
                                  height: MediaQuery.of(context).size.height * 0.25,
                                  width: MediaQuery.of(context).size.width * 0.40,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.vertical(),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Image.network(
                                    widget.movieImage,
                                  ),
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
                                    child: Text(widget.voteAverage),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Text(overview),
                                  height: 100,
                                  width: 200,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  child: Text(allGenres),
                                  height: 100,
                                  width: 200,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
