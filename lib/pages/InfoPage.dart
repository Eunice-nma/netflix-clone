import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/Utilities/GetImage.dart';
import 'package:netflix_clone/widgets/CustomCard.dart';
import 'package:netflix_clone/utilities/Constants.dart';
import 'package:netflix_clone/widgets/CustomMaterialButton.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  DateTime releaseDate = DateTime.parse(Get.arguments.release_date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Get.arguments.poster_path == null
          ? Center(
              child: Text(
                "Nothing to show for now",
                style: kWhiteBoldText,
              ),
            )
          : Stack(
              children: <Widget>[
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
                  child: FittedBox(
                    child: Image.network(
                      getImagePoster(Get.arguments.poster_path),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomCard(
                          image: getImagePoster(Get.arguments.poster_path),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '${Get.arguments.vote_average} vote',
                              style: kGreenText,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              releaseDate.year.toString(),
                              style: kWhiteRegularText,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.1),
                              ),
                              child: Text(
                                '16+',
                                style: kWhiteRegularText,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomMaterialButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icons.play_arrow,
                          iconColor: Colors.black,
                          buttonText: 'Watch',
                          textStyle: kBlackBoldText,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomMaterialButton(
                            onPressed: () {},
                            icon: Icons.download_sharp,
                            iconColor: Colors.white,
                            buttonText: 'Download',
                            textStyle: kWhiteBoldText,
                            color: Colors.white.withOpacity(0.1)),
                        SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            Get.arguments.original_title,
                            style: kWhiteBoldText,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Text(
                            Get.arguments.overview,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                            style: kWhiteRegularText,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
