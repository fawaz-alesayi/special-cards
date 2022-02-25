abstract class Label {
  String key;
  
  Label({
    required this.key,
  });

  /// A textual representation of the label. Different for each type of label.
  String getText();
}

class DateLabel extends Label {
  DateTime value;
  DateLabel({
    required this.value,
    required String key,
  }) : super(key: key);

  @override
  String getText() {
    return value.toLocal().toString().split(' ')[0];
  }
}

class TextLabel extends Label {
  String value;
  TextLabel({
    required this.value,
    required String key,
  }) : super(key: key);

  @override
  String getText() {
    return value;
  }
}