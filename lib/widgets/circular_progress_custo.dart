import 'package:flutter/material.dart';
import 'colors.dart';

class CenteredCircularProgress extends StatelessWidget {
  final String message;
  final double loadingSize;
  final double fontSize;

  CenteredCircularProgress({
    this.message = 'Carregando',
    this.loadingSize = 64.0,
    this.fontSize = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: loadingSize,
            width: loadingSize,
            child: const CircularProgressIndicator(color: AppColor.blue,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              message,
              style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}