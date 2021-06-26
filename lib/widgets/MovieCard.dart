import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Utilities/Constants.dart';
import 'package:netflix_clone/Utilities/GetImage.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/pages/InfoPage.dart';

class MovieCards extends StatelessWidget {

  final AsyncSnapshot<dynamic> movieSnapShot;
  final int index;
  final double movieCardHeight;
  final double movieCardWidth;

  const MovieCards({
    this.movieSnapShot,
    this.index,
    this.movieCardHeight,
    this.movieCardWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => InfoPage(),
              arguments: movieSnapShot.data[index]);
        },
        child: Card(
          color: kMovieContainerColor,
          child: Column(
            children: [
              Expanded(
                child: movieSnapShot.data[index].poster_path == null
                    ? Center(
                    child: Text(
                      'No poster yet',
                      style: kPosterText,
                    ))
                    : CachedNetworkImage(
                  imageUrl: getImagePoster(
                      movieSnapShot.data[index].poster_path),
                  width: movieCardWidth ?? 100,
                  height: movieCardHeight ?? 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}