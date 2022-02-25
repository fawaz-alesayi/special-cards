import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_cards/template.dart';

import 'package:invitation_cards/utils.dart';

import 'domain/labels.dart';

class BodyText extends StatelessWidget {
  final String text;
  final List<Label> labels;

  const BodyText({
    Key? key,
    required this.text,
    required this.labels,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> textTokens = text.split(" ").intersperse(" ");
    List<String> labelValues = labels.map((label) => labelTextFormat(label.getText())).toList();
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText1,
        children: textTokens.map((token) {
          if (labelValues.contains(token)) {
            return WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: labelView(labels.firstWhere((element) => element.getText() == removeFormat(token))),
            );
          } else {
            return TextSpan(text: token);
          }
        }).toList(),
      ),
    );
  }

  String labelTextFormat(String label) => "{" + label + "}";

  String removeFormat(String text) => text.replaceAll(RegExp(r"\{|\}"), "");
}

