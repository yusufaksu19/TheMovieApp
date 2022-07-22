import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_app/view_models/movie_details_view_model.dart';
import 'package:the_movie_app/view_models/movie_search_view_model.dart';
import 'package:the_movie_app/views/search_movies_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieSearchViewModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => MovieDetailsViewModel(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SearchMoviesPage(),
      ),
    );
  }
}
