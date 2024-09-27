import 'package:flutter/material.dart';
import 'package:agenda/core/utils/app_color.dart';

class CenteredCircularProgress extends StatelessWidget {
  final String message;
  final double loadingSize;
  final double fontSize;

  const CenteredCircularProgress({
    Key? key,
    this.message = 'Carregando',
    this.loadingSize = 64.0,
    this.fontSize = 14.0,
  }) : super(key: key);

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
            child: CircularProgressIndicator(
              color: AppColor.instance.primary,
            ),
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
