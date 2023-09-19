import 'package:flutter/material.dart';

class InputCustom extends StatelessWidget {
  final String title;
  final Widget child;
  const InputCustom({
    Key? key,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom:20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 3, bottom: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
