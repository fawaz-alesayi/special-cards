import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedScaffold extends StatelessWidget {
  final Widget? body;
  final double topPadding;
  final double horizontalPadding;

  const SharedScaffold({Key? key, this.body, this.topPadding = 0, this.horizontalPadding = 32}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding, top: topPadding),
        child: body,
      )
    );
  }

}