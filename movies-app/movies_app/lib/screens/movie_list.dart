import 'package:flutter/material.dart';
import 'package:movies_app/models/response_model.dart';
import 'package:movies_app/network/repository/movie_repository.dart';
import 'package:movies_app/screens/movie_details.dart';
import 'package:movies_app/utils/network_utils.dart';

import '../models/movie_model.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieRepository movieRepository = MovieRepository();
  int page=1;
  ResponseModel? response;

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  fetchMovies() async{
    response = await movieRepository.getMovies(page: page);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Movie List")),
      body: (response == null)
          ? const Center(child: Text("Please wait..."))
          : Padding(
            padding: const EdgeInsets
                .symmetric(horizontal: 15, vertical: 15),
            child: ListView.separated(
                itemCount: response?.results?.length ?? 0,
                itemBuilder: (context, index){
                  return movie(movie: response?.results?[index], index: index);
                },
                separatorBuilder: (context, index){
                  return const SizedBox(height: 10);
                },
      ),
          ),
    );
  }

  Widget movie({Movie? movie, required int index}){
    if(movie == null){
      return const Text("Movie Not Found");
    }else{
      return Container(
        // color: (index % 2 == 0)
        //     ? Colors.grey.shade300
        //     : Colors.blueGrey.shade100,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => MovieDetails(movie: movie)));
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(
                    "${NetworkUtils.imagePath}${movie.posterPath}",
                  fit: BoxFit.fitHeight,
                  height: 200,
                  width: 100,
                ),
                const SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(movie.title ?? "",
                      style: const TextStyle(fontSize: 20)),
                    // Text(movie.overview ?? "")
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}
