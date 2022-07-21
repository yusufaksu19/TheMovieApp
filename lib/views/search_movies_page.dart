import 'package:flutter/material.dart';
import 'package:the_movie_app/widgets/movie_card.dart';

class SearchMoviesPage extends StatefulWidget {
  const SearchMoviesPage({Key? key}) : super(key: key);

  @override
  State<SearchMoviesPage> createState() => _SearchMoviesPageState();
}

class _SearchMoviesPageState extends State<SearchMoviesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
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
          // Movies
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.83,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                childAspectRatio: 3 / 4,
              ),
              itemCount: 12,
              itemBuilder: (context, index) => MovieCard(),
            ),
          ),
        ],
      )),
    );
  }
}
