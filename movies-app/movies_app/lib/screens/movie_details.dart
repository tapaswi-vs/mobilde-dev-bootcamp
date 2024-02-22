import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${movie.title}"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Text(
            "Overview \n\n\n${movie.overview ?? ''}",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
