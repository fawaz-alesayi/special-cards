import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_cards/body_text.dart';
import 'package:invitation_cards/domain/labels.dart';
import 'package:invitation_cards/domain/template.dart';
import 'package:invitation_cards/template.dart';

Template defaultGeneralTemplate = Template(
    title: "Invitation",
    body: "I would be happy to see you at {Place} on {Time}",
    labels: [
      DateLabel(key: "Time", value: DateTime(2022, 1, 1, 12, 0)),
      TextLabel(key: "Place", value: ''),
      TextLabel(key: "Recepient", value: ''),
      MultiChoiceLabel(
          value: "Hello",
          choices: ["Hello", "Hi", "Greetings"],
          key: "Greeting")
    ]);

class GeneralTemplateCard extends StatelessWidget {
  final bool tappable;

  Template template;

  GeneralTemplateCard({Key? key, this.tappable = false, required this.template})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateCard(
      template: template,
      tappable: tappable,
      children: [
        Text(template.title, style: Theme.of(context).textTheme.headline3),
        Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
                child: labelView(template.labels
                    .firstWhere((label) => label.key == "Greeting")),
                width: 105.0),
          ),
          SizedBox(
              child: labelView(template.labels
                  .firstWhere((label) => label.key == "Recepient")),
              width: 105.0),
        ]),
        Wrap(children: [
          BodyText(text: template.rawBody, labels: template.labels)
        ]),
      ],
    );
  }
}
