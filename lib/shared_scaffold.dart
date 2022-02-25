import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedScaffold extends StatelessWidget {
  final Widget? body;
  final double topPadding;

  const SharedScaffold({Key? key, this.body, this.topPadding = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: EdgeInsets.only(left: 32, right: 32, top: topPadding),
        child: body,
      )
    );
  }

}