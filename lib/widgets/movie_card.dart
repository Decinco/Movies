import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies/screens/actor_details_screen.dart';
import 'package:movies/screens/details_screen.dart';

import '../api/api.dart';
import '../models/actor.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Get.to(DetailsScreen(
              movie: movie,
            )),
        child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: SizedBox(
                          width: 80,
                          height: 120,
                          child: Image(
                            image: NetworkImage(movie.posterPath != ""
                                ? "${Api.imageBaseUrl}${movie.posterPath}"
                                : "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-for-website-design-or-mobile-app-no-photo-available_87543-11093.jpg"),
                            fit: BoxFit.cover,
                          )),
                    )),
                Text(movie.title)
              ],
            )));
  }
}
