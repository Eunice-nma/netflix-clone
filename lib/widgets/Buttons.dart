import 'package:flutter/material.dart';
import 'package:netflix_clone/Utilities/Constants.dart';

class CustomButtons extends StatelessWidget {
  final String title;
  final Function onPressed;
  final IconData icon;

  const CustomButtons({Key key, this.title, this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kButtonColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      constraints: BoxConstraints(minWidth: 80.0, minHeight: 30.0),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: kPlayIconColor,
          ),
          Text(
            title,
            style: kButtonText,
          ),
        ],
      ),
    );
  }
}
