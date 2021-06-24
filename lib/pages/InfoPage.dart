// import 'dart:convert';
import 'dart:ui';
// import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/customWidgets/CustomCard.dart';
import 'package:netflix_clone/utilities/Constants.dart';

// const apiKey = '5fcf79b63a307fe9f032c6a23dd43094';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  // void getMovieData() async {
  //   http.Response response = await http.get(Uri.parse(
  //       'https://api.themoviedb.org/3/movie/550?api_key=5fcf79b63a307fe9f032c6a23dd43094'));
  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     var decodedData = jsonDecode(data);
  //     print(decodedData['production_companies'][0]['name']);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // getMovieData();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox(
              constraints: const BoxConstraints.expand(),
              child: FittedBox(
                child: Image.asset(Get.arguments.imageURL),
                fit: BoxFit.fill,
              )),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomCard(
                    image: Get.arguments.imageURL
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '82% match',
                        style: kGreenText,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        Get.arguments.releaseYear,
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
                      Text(
                        '1 Season',
                        style: kWhiteRegularText,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomMaterialButton(
                    onPressed: () {Get.back();},
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
                      onPressed: (){},
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
                      Get.arguments.name,
                      style: kWhiteBoldText,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    Get.arguments.description,
                    style: kWhiteRegularText,
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

class CustomMaterialButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final TextStyle textStyle;
  final IconData icon;
  final Color iconColor;
  final Function onPressed;
  const CustomMaterialButton(
      {this.buttonText,
      this.color,
      this.textStyle,
      this.icon,
      this.iconColor,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: color,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 50,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: iconColor,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            buttonText,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
