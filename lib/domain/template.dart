import 'package:invitation_cards/domain/labels.dart';


typedef LabelName = String;


/// The message template
///
/// [labels] refer to the interactable elements of the body text
class Template {
  String title;

  /// The raw body text of the template
  /// 
  /// Example:
  /// Hello, my name is {name} and I am {age} years old.
  final String _body;

  Map<LabelName, Label> labels;

  Template({
    required this.title,
    required String body,
    required this.labels,
  } ) : _body = body;

  /// replace the labels in the body text with the values in [labels]
  /// Labels are enclosed in curly braces {}
  String get body {
    return _body.replaceAllMapped(RegExp(r'{([^}]+)}'), (Match m) {
      if (labels.containsKey(m.group(1))) {
        return labels[m.group(1)]!.getText();
      } else {
        return m.group(0)!;
      }
    });
  }
}

abstract class TemplateView {}
