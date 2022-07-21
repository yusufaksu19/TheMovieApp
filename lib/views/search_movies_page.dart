import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_app/view_models/movie_search_view_model.dart';

import 'package:the_movie_app/widgets/movie_card.dart';

import '../enums/enums.dart';

class SearchMoviesPage extends StatefulWidget {
  const SearchMoviesPage({Key? key}) : super(key: key);

  @override
  State<SearchMoviesPage> createState() => _SearchMoviesPageState();
}

class _SearchMoviesPageState extends State<SearchMoviesPage> {
  TextEditingController _searchMovieController = TextEditingController();

  void searchMovies(String movieTitle, int pageNumber) async {
    MovieSearchViewModel movieSearchViewModel = Provider.of<MovieSearchViewModel>(context, listen: false);
    await movieSearchViewModel.searchMovies(movieTitle, pageNumber);
  }

  @override
  Widget build(BuildContext context) {
    MovieSearchViewModel movieSearchViewModel = Provider.of<MovieSearchViewModel>(context);

    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            // Movie Search Bar
            Container(
              margin: const EdgeInsets.all(6),
              height: MediaQuery.of(context).size.height * 0.06,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(),
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: TextFormField(
                onChanged: (value) {
                  if (value.length > 2) {
                    searchMovies(value, 1);
                  }
                },
                controller: _searchMovieController,
                style: const TextStyle(
                  height: 1,
                  fontSize: 25,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 6),
                ),
              ),
            ),

            if (movieSearchViewModel.loadingStatus == LoadingStatus.initial)
              const Text('no data')
            // Movies
            else if (movieSearchViewModel.loadingStatus == LoadingStatus.loading)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.83,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 3 / 4,
                  ),
                  itemCount: movieSearchViewModel.moviesPage.results.length,
                  itemBuilder: (context, index) => MovieCard(
                    index: index,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
