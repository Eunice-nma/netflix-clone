import 'package:flutter/material.dart';
import 'package:netflix_clone/customWidgets/CustomCard.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/pages/InfoPage.dart';
import 'package:netflix_clone/utilities/myListModal.dart';

class MyListPage extends StatefulWidget {
  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  List<MyList> myListArray = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: Image.network(
              'https://1000logos.net/wp-content/uploads/2017/05/Netflix-Logo-2006.png',
              width: 100,
              height: 90,
              fit: BoxFit.cover,
            ),
            title: Text('My List'),
            centerTitle: false,
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: myListArray.length == 0
                ? Center(
                    child: Text('No movie'),
                  )
                : GridView.builder(
                    itemCount: myListArray.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (160 / 220),
                      crossAxisCount: (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? 2
                          : 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(InfoPage(), arguments: myListArray[index]);
                        },
                        child: CustomCard(
                          image: myListArray[index].imageURL,
                        ),
                      );
                    },
                  ),
          )),
    );
  }
}
