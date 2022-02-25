import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_cards/shared_scaffold.dart';
import 'package:invitation_cards/templates/general.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      topPadding: 128.0,
      body: Column(
        children: const [GeneralTemplate()],
      ),
    );
  }
}
