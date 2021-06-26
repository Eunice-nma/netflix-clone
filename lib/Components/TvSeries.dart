import 'package:flutter/material.dart';
import 'package:netflix_clone/Components/Movies.dart';
import 'package:netflix_clone/Models/TvSeriesModel.dart';
import 'package:netflix_clone/services/Services.dart';
import 'package:netflix_clone/widgets/MovieCard.dart';

class TvSeries extends StatefulWidget {
  @override
  _TvSeriesState createState() => _TvSeriesState();
}

class _TvSeriesState extends State<TvSeries> {
  Future<List<TvSeriesModel>> seriesMovies;

  Api _api;

  @override
  void initState() {
    super.initState();
    _api = Api();
    seriesMovies = _api.fetchTvSeriesMovies();
  }

  @override
  Widget build(BuildContext context) {
    return MoviesContainer(
      movieListName: "Tv Series",
      containerHeight: 220,
      futureBuilder: FutureBuilder(
        future: seriesMovies,
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
                    movieCardHeight: 120,
                    movieCardWidth: 150,
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
            ));
          }
        },
      ),
    );
    //   Column(
    //   children: [
    //     Container(
    //         width: double.infinity,
    //         padding: EdgeInsets.all(4),
    //         margin: EdgeInsets.only(left: 8, top: 8, right: 8),
    //         child: Text(
    //           "Tv Series ",
    //           style: kBillBoardText,
    //         )),
    //     Container(
    //       color: kMovieContainerColor,
    //       margin: EdgeInsets.only(left: 8, right: 8),
    //       height: 220,
    //       child: FutureBuilder(
    //         future: seriesMovies,
    //         builder: (_, AsyncSnapshot snapshot) {
    //           if (snapshot.connectionState == ConnectionState.done &&
    //               snapshot.hasError) {
    //             return Center(
    //               child: Container(
    //                   height: 50, child: Text('Sorry, An Error Occurred')),
    //             );
    //           } else if (snapshot.hasData) {
    //             return ListView.builder(
    //                 scrollDirection: Axis.horizontal,
    //                 itemCount:
    //                     snapshot.data.length == null ? 0 : snapshot.data.length,
    //                 itemBuilder: (context, index) {
    //                   return Padding(
    //                     padding: const EdgeInsets.all(2.0),
    //                     child: GestureDetector(
    //                       onTap: (){
    //                         Get.to(()=>InfoPage(), arguments: snapshot.data[index]);
    //                       },
    //                       child: Card(
    //                         color: kMovieContainerColor,
    //                         child: Column(
    //                           // mainAxisAlignment: MainAxisAlignment.center,
    //                           // crossAxisAlignment: CrossAxisAlignment.center,
    //                           children: [
    //                             Expanded(
    //                               child: snapshot.data[index].poster_path == null
    //                                   ? Center(
    //                                       child: Text(
    //                                       'No poster yet',
    //                                       style: kPosterText,
    //                                     ))
    //                                   : CachedNetworkImage(
    //                                       imageUrl: getImagePoster(
    //                                           snapshot.data[index].poster_path),
    //                                       width: 150,
    //                                       height: 120,
    //                                     ),
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 });
    //           } else {
    //             return Center(child: CircularProgressIndicator(
    //               valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
    //             ));
    //           }
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}
