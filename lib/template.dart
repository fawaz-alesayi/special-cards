import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invitation_cards/drop_down_button.dart';

class Template {
  String title;
  String body;
  List<String> userInputs;

  Template(
      {required this.body,
      required this.userInputs,
      this.title = "Invitation"});
}

class TemplateWidget extends StatefulWidget {
  final Template template;

  TemplateWidget({required this.template});

  @override
  _TemplateWidgetState createState() => _TemplateWidgetState();
}

class _TemplateWidgetState extends State<TemplateWidget> {
  late List<String> userInputs;

  @override
  void initState() {
    super.initState();
    userInputs = List.from(widget.template.userInputs);
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
          Text(widget.template.title,
              style: Theme.of(context).textTheme.headline3),
          Row(
            
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(child: GreetingsChooser(), width: 102),
              ),
              SizedBox(
                width: 100,
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: "Name",
                    contentPadding: EdgeInsets.all(0.0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      userInputs[0] = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Wrap(
            children: [
              Text(widget.template.body,
                  style: Theme.of(context).textTheme.bodyText1)
            ],
          ),
        ],
      ),
    );
  }
}