import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GreetingsChooser extends StatefulWidget {
  const GreetingsChooser({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _GreetingsChooserState();
  }
}

class _GreetingsChooserState extends State<GreetingsChooser> {
  final List<String> choices = [
    'Dear',
    'Greetings',
    'Hello',
    'Hi',
    'Howdy',
    'Salutations',
    'Sup',
    'Yo'
  ];
  String selectedItem = 'Dear';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedItem,
      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      onChanged: (String? newValue) {
        setState(() {
          selectedItem = newValue!;
        });
      },
      selectedItemBuilder: (context) => choices
          .map<Widget>((String choice) => Text(
                choice,
                style: TextStyle(color: Colors.white),
              ))
          .toList(),
      items: choices.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
