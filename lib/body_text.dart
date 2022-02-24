import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:invitation_cards/utils.dart';

class BodyText extends StatelessWidget {
  final String text;
  final List<String> userInputs;

  const BodyText({
    Key? key,
    required this.text,
    required this.userInputs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> textTokens = text.split(" ").intersperse(" ");
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        children: textTokens
            .map( (token) {
              if (userInputs.contains(token)) {
                return TextSpan(
                  text: token,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              } else {
                return TextSpan(
                  text: token
                );
              }
            })
            .toList(),
      ),
    );
  }
}
