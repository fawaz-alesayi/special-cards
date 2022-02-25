abstract class Label {

  /// A textual representation of the label. Different for each type of label.
  String getText();
}

class DateLabel extends Label {
  DateTime value;
  DateLabel({
    required this.value,
  });

  @override
  String getText() {
    return value.toString();
  }
}

class TextLabel extends Label {
  String value;
  TextLabel({
    required this.value,
  });

  @override
  String getText() {
    return value;
  }
}