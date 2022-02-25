import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invitation_cards/domain/labels.dart';

class MultiChoiceLabelView<T> extends StatefulWidget {
  final MultiChoiceLabel<T> label;
  
  const MultiChoiceLabelView({Key? key, required this.label}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MultiChoiceLabelViewState();
  }
}

class _MultiChoiceLabelViewState<T> extends State<MultiChoiceLabelView<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: widget.label.value,
      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      onChanged: (T? newValue) {
        setState(() {
          widget.label.value = newValue!;
        });
      },
      selectedItemBuilder: (context) => widget.label.choices
          .map((T choice) => Text(
                choice.toString(),
                style: TextStyle(color: Colors.white),
              ))
          .toList(),
      items: widget.label.choices.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
