import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    List<String> formattedLabelValues =
        labels.map((label) => addFormat(label.key)).toList();
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText1,
        children: textTokens.map((token) {
          if (formattedLabelValues.contains(token)) {
            Label l = labels.firstWhere((label) => label.key == removeFormat(token));
            return WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: labelView(l),
            );
          } else {
            return TextSpan(text: token);
          }
        }).toList(),
      ),
    );
  }

  String addFormat(String label) => "{" + label + "}";

  String removeFormat(String text) => text.replaceAll(RegExp(r"\{|\}"), "");
}

Widget labelView(Label label) {
  switch (label.runtimeType) {
    case TextLabel:
      return TextLabelView(label: label);
    case DateLabel:
      return DateLabelView(label: label);
    default:
      return TextLabelView(label: label);
  }
}

class TextLabelView extends StatefulWidget {
  final Label label;

  const TextLabelView({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<TextLabelView> createState() => _TextLabelViewState();
}

class _TextLabelViewState extends State<TextLabelView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 100.0,
          child: TextField(
            decoration: const InputDecoration(
              hintText: ""
            ),
            onChanged: (value) => {}
          ),
        ));
  }
}

class DateLabelView extends StatefulWidget {
  final Label label;

  const DateLabelView({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _DateLabelViewState();
  }
}

class _DateLabelViewState extends State<DateLabelView> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          debugPrint("Hello");
          _selectDate(context);
        },
        child: Text(selectedDate.dateString),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
  }
}
