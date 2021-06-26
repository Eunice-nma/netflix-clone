import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/Components/NowPlaying.dart';
import 'package:netflix_clone/Components/TrendingMovies.dart';
import 'package:netflix_clone/Components/TvSeries.dart';
import 'package:netflix_clone/Components/UpcomingMovies.dart';
import 'package:netflix_clone/Models/NowPlayingModel.dart';
import 'package:netflix_clone/Utilities/GetImage.dart';
import 'package:netflix_clone/services/Services.dart';
import 'package:netflix_clone/widgets/Buttons.dart';
import 'package:netflix_clone/widgets/CustomIcons.dart';
import 'package:get/get.dart';
import 'InfoPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<NowPlayingModel>> nowPlayingMovies;

  Api _api;

  @override
  void initState() {
    super.initState();
    _api = Api();
    nowPlayingMovies = _api.fetchNowPlayingMovies();
    print(nowPlayingMovies);
  }

  @override
  Widget build(BuildContext context) {
    // var idx = 1;
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          Container(
            child: FutureBuilder(
                future: nowPlayingMovies,
                // ignore: missing_return
                builder: (context, AsyncSnapshot snapshot) {
                  // ignore: unnecessary_statements
                  // List<CachedNetworkImage> cachedImages =
                  //     List<CachedNetworkImage>.empty(growable: true);
                  if (snapshot.connectionState == ConnectionState.none &&
                      snapshot.hasError) {
                    return Center(
                      child: Text('An Error Occurred'),
                    );
                  } else if (snapshot.hasData) {
                    return Stack(children: <Widget>[
                      Container(
                        height: 350,
                        child: Center(
                          child:  snapshot.data[5].poster_path == null
                              ? Text("No poster yet")
                              : CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: getImagePoster(
                                snapshot.data[5].poster_path),
                          ),
                        ),
                      ),
                      Container(
                        height: 350.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          gradient: LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Colors.grey.withOpacity(0.0),
                              Colors.black,
                            ],
                            stops: [0.0, 1.0],
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 290,
                        //  right: 3,
                        //  bottom: 5,

                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomIcon(
                                icon: Icons.add,
                                title: "My List",
                              ),
                              CustomButtons(
                                title: "Play",
                                icon: Icons.play_arrow,
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.to(()=>InfoPage(),arguments: snapshot.data[5]);
                                },
                                child: CustomIcon(
                                  icon: Icons.info,
                                  title: "Info",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
                      ),
                    );
                  }
                }),
          ),

          PopularMovies(),

// 2nd ListView
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.all(4),
          //   margin: EdgeInsets.only(left: 8, top: 8, right: 8),
          //   child: Text(
          //     "Popular on Netflix",
          //     style: kbillBoardText,
          //   ),
          // ),
          // Container(
          //   color: Colors.white,
          //   margin: EdgeInsets.only(left: 8, right: 8),
          //   height: 160,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 10,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.all(2.0),
          //           child: Card(
          //             child: Column(
          //               children: [
          //                 Image.network(
          //                   "https://purepng.com/public/uploads/large/purepng.com-mariomariofictional-charactervideo-gamefranchisenintendodesigner-1701528634653vywuz.png",
          //                   width: 100,
          //                   height: 100,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          // ),

//3rd List
          UpComingMovies(),
          //4th List
          DramaMovies(),

          //4th List
          TvSeries(),
          //5th List
          // Container(
          //     width: double.infinity,
          //     padding: EdgeInsets.all(4),
          //     margin: EdgeInsets.only(left: 8, top: 8, right: 8),
          //     child: Text(
          //       "New Releases",
          //       style: kbillBoardText,
          //     )),
          // Container(
          //   color: Colors.white,
          //   margin: EdgeInsets.only(left: 8, right: 8),
          //   height: 160,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: 10,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: const EdgeInsets.all(2.0),
          //           child: Card(
          //             child: Column(
          //               children: [
          //                 Image.network(
          //                   "https://purepng.com/public/uploads/large/purepng.com-mariomariofictional-charactervideo-gamefranchisenintendodesigner-1701528634653vywuz.png",
          //                   width: 100,
          //                   height: 100,
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       }),
          // ),
        ],
      ),
    );
  }
}

// class Carousel extends StatelessWidget {
//   const Carousel({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider.builder(
//         itemCount: snapshot.data.length,
//         options: CarouselOptions(
//             height: 350,
//             autoPlay: true,
//             enableInfiniteScroll: false,
//             enlargeCenterPage: true,
//             scrollDirection: Axis.horizontal,
//             scrollPhysics: const BouncingScrollPhysics(),
//             enlargeStrategy:
//                 CenterPageEnlargeStrategy.height,
//             autoPlayCurve: Curves.easeOutSine,
//             autoPlayInterval: Duration(seconds: 30),),
//         itemBuilder: (ctx, int index, x) {
//           return snapshot.data[index].poster_path == null
//               ? Text("No poster yet")
//               : CachedNetworkImage(
//                   fit: BoxFit.fitWidth,
//                   imageUrl: getImagePoster(
//                       snapshot.data[index].poster_path),
//
//                 );
//         },);
//   }
// }
