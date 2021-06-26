import 'package:flutter/material.dart';
import 'package:netflix_clone/Utilities/Constants.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomIcon({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: Column(
          children: [
           Icon(icon,color: kIconColor ,),
            Text(
              title,
              style: kBillBoardText,
            ),
            
          ],
        ));
  }
}
