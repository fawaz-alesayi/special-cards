import 'package:flutter/widgets.dart';
import 'package:invitation_cards/domain/labels.dart';
import 'package:invitation_cards/template.dart';

class GeneralTemplate extends StatelessWidget {
  final bool tappable;
  const GeneralTemplate({
    Key? key,
    this.tappable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateCard(
      body: "I would be happy to see you at {Time} on {Place}",
      labels: [
        DateLabel(key: "Time", value: DateTime.now()),
        TextLabel(key: "Place", value: '')
      ],
      tappable: tappable,
    );
  }
}
