import 'package:flutter/material.dart';
import 'package:netflix_clone/Utilities/Constants.dart';

class MoviesContainer extends StatelessWidget {

  final String movieListName;
  final Widget futureBuilder;
  final double containerHeight;

  const MoviesContainer(
      {this.movieListName, this.futureBuilder, this.containerHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.all(4),
            margin: EdgeInsets.only(left: 8, top: 8, right: 8),
            child: Text(
              movieListName,
              style: kBillBoardText,
            )),
        Container(
          color: kMovieContainerColor,
          margin: EdgeInsets.only(left: 8, right: 8),
          height: containerHeight ?? 160,
          child: futureBuilder
        ),
      ],
    );
  }
}








// class MoviesDisplay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//     );
//   }
// }

