import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final double width;
  final double height;

  const CustomCard({this.image, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 250,
      width: width ?? 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: FittedBox(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(image),
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
