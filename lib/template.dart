import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_cards/body_text.dart';
import 'package:invitation_cards/domain/template.dart';
import 'package:invitation_cards/drop_down_button.dart';

import 'domain/labels.dart';

class TemplateCard extends StatefulWidget {
  final String title;
  final String body;
  final List<Label> labels;

  TemplateCard(
      {this.title = "Invitation", required this.body, required this.labels});

  @override
  _TemplateCardState createState() => _TemplateCardState();
}

class _TemplateCardState extends State<TemplateCard> {
  late Template template;

  @override
  void initState() {
    super.initState();
    template = Template(body: widget.body, labels: {}, title: widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 250.0,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(colors: [
          Color(0xFF561EB5),
          Color(0xFF6022C9),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        boxShadow: [
          BoxShadow(
            color: Color(
              0xe53f1684,
            ),
            offset: Offset(
              11,
              11,
            ),
            blurRadius: 28,
          ),
          BoxShadow(
            color: Color(
              0xe5772afa,
            ),
            offset: Offset(
              -11,
              -11,
            ),
            blurRadius: 22,
          ),
          BoxShadow(
            color: Color(
              0x333f1684,
            ),
            offset: Offset(
              11,
              -11,
            ),
            blurRadius: 22,
          ),
          BoxShadow(
            color: Color(
              0x333f1684,
            ),
            offset: Offset(
              -11,
              11,
            ),
            blurRadius: 22,
          ),
          BoxShadow(
            color: Color(
              0x7f3f1684,
            ),
            offset: Offset(
              -1,
              -1,
            ),
            blurRadius: 2,
          ),
          BoxShadow(
            color: Color(
              0x4c772afa,
            ),
            offset: Offset(
              1,
              1,
            ),
            blurRadius: 2,
          ),
        ],
      ),
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.headline3),
          Row(children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(child: GreetingsChooser(), width: 102),
            ),
            SizedBox(
              width: 100,
              child: CardTextField(),
            ),
          ]),
          Wrap(children: [BodyText(text: widget.body, labels: widget.labels)]),
        ],
      ),
    );
  }
}

class CardTextField extends StatelessWidget {
  const CardTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: "Name",
          contentPadding: EdgeInsets.all(0.0),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          )),
    );
  }
}

Widget labelView(Label label) {
  switch (label.runtimeType) {
    case TextLabel:
      return TextButton(onPressed: () {}, child: Text(label.getText()));
    case DateLabel:
      return TextField();
    default:
      return TextButton(onPressed: () {}, child: Text(label.toString()));
  }
}
