import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_cards/utils.dart';

import 'domain/labels.dart';
import 'multi_choice_label_view.dart';

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
    List<String> formattedLabelKeys =
        labels.map((label) => addFormat(label.key)).toList();
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.bodyText1,
        children: textTokens.map((token) {
          if (formattedLabelKeys.contains(token)) {
            Label l =
                labels.firstWhere((label) => label.key == removeFormat(token));
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
  if (label is TextLabel) {
    return TextLabelView(label: label);
  }
  if (label is DateLabel) {
    return DateLabelView(label: label);
  }
  if (label is MultiChoiceLabel) {
    return MultiChoiceLabelView(label: label);
  }
  return DefaultLabelView(label: label);
}

class TextLabelView extends StatefulWidget {
  final TextLabel label;

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
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: "Enter text",
            ),
            onChanged: (value) => {
              setState(() {
                widget.label.value = value;
              })
            },
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

class DefaultLabelView extends StatelessWidget {
  final Label label;

  const DefaultLabelView({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label.getText());
  }
}
