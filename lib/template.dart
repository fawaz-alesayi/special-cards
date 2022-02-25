import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_cards/body_text.dart';
import 'package:invitation_cards/domain/template.dart';
import 'package:invitation_cards/multi_choice_label_view.dart';
import 'package:invitation_cards/utils.dart';

import 'domain/labels.dart';

class TemplateCard extends StatefulWidget {
  final Template template;
  List<Widget> children;
  bool tappable;

  TemplateCard({required this.template, this.tappable = true, required this.children});

  @override
  _TemplateCardState createState() => _TemplateCardState();
}

class _TemplateCardState extends State<TemplateCard> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.tappable) {
          Navigator.pushNamed(context, '/template', arguments: widget.template);
        }
      },
      child: Container(
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
          children: widget.children
        ),
      ),
    );
  }
}
