import 'package:flutter/material.dart';


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