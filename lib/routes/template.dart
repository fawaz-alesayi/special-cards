import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_cards/domain/template.dart';
import 'package:invitation_cards/shared_scaffold.dart';
import 'package:invitation_cards/templates/general.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Template;

    return SharedScaffold(
      horizontalPadding: 0.0,
      body: Column(children: [
        Container(
          // Half the screen vertically,
          // and centered horizontally
          height: MediaQuery.of(context).size.height / 2,
          padding: EdgeInsets.only(top: 64.0, left: 32.0, right: 32.0),
          color: Colors.white,
          child: Stack(
            children: [
              GeneralTemplateCard(
                template: args,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
