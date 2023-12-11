import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTitle extends StatelessWidget {

  final String itemname;
  final String itemprice;
  final String imagepath;
  final color;
  void Function()? onPressed;

  ItemTitle({
    required this.itemname,
    required this.itemprice,
    required this.imagepath,
    this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: color[100],
        borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          Image.asset(imagepath, height: 120,),

          Text(itemname),

          MaterialButton(
            onPressed: onPressed,
            color: color[400],
            child: Text(itemprice+"원",
            style: TextStyle(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold,
            ),
            ),
          )
        ],),
      ),
    );
  }
}
