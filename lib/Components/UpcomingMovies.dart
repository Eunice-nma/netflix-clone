import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Components/Movies.dart';
import 'package:netflix_clone/Models/UpComingMoviesModel.dart';
import 'package:netflix_clone/services/Services.dart';
import 'package:netflix_clone/widgets/MovieCard.dart';

class UpComingMovies extends StatefulWidget {
  @override
  _UpComingMoviesState createState() => _UpComingMoviesState();
}

class _UpComingMoviesState extends State<UpComingMovies> {
  Future<List<UpCommingMoviesModel>> upComingMovies;
  Api _api;

  @override
  void initState() {
    super.initState();
    _api = Api();
    upComingMovies = _api.fetchUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MoviesContainer(
      movieListName: "UpComing Movies",
      futureBuilder: FutureBuilder(
        future: upComingMovies,
        // ignore: missing_return
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            return Center(
              child: Container(
                  height: 50, child: Text('Sorry, An Error Occurred'),),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
              snapshot.data.length == null ? 0 : snapshot.data.length,
              itemBuilder: (context, index) {
                return MovieCards(
                  movieSnapShot: snapshot,
                  index: index,
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
              ),
            );
          }
        },
      ),
    );

    //   Column(
    //   children: [
    //     //3rd List view
    //     Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(4),
    //         margin: EdgeInsets.only(left: 8, top: 8, right: 8),
    //         child: Text(
    //           "UpComing Movies",
    //           style: kBillBoardText,
    //         )),
    //     Container(
    //       color: kMovieContainerColor,
    //       margin: EdgeInsets.only(left: 8, right: 8),
    //       height: 160,
    //       child: FutureBuilder(
    //         future: upComingMovies,
    //         // ignore: missing_return
    //         builder: (_, AsyncSnapshot snapshot) {
    //           if (snapshot.connectionState == ConnectionState.done &&
    //               snapshot.hasError) {
    //             return Center(
    //               child: Container(
    //                   height: 50, child: Text('Sorry, An Error Occurred')),
    //             );
    //           } else if (snapshot.hasData) {
    //             return ListView.builder(
    //               scrollDirection: Axis.horizontal,
    //               itemCount:
    //                   snapshot.data.length == null ? 0 : snapshot.data.length,
    //               itemBuilder: (context, index) {
    //                 return Padding(
    //                   padding: const EdgeInsets.all(2.0),
    //                   child: GestureDetector(
    //                     onTap: () {
    //                       Get.to(() => InfoPage(),
    //                           arguments: snapshot.data[index]);
    //                     },
    //                     child: Card(
    //                       color: kMovieContainerColor,
    //                       child: Column(
    //                         // mainAxisAlignment: MainAxisAlignment.center,
    //                         // crossAxisAlignment: CrossAxisAlignment.center,
    //                         children: [
    //                           Expanded(
    //                             child: snapshot.data[index].poster_path == null
    //                                 ? Center(
    //                                     child: Text(
    //                                     'No poster yet',
    //                                     style: kPosterText,
    //                                   ))
    //                                 : CachedNetworkImage(
    //                                     imageUrl: getImagePoster(
    //                                         snapshot.data[index].poster_path),
    //                                     width: 100,
    //                                     height: 100,
    //                                   ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                 );
    //               },
    //             );
    //           } else {
    //             return Center(
    //               child: CircularProgressIndicator(
    //                 valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
    //               ),
    //             );
    //           }
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}
