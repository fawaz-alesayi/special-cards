import 'package:invitation_cards/domain/labels.dart';
import 'package:collection/collection.dart';

/// The message template
///
/// [labels] refer to the interactable elements of the template
class Template {
  final String title;
  /// The raw body text of the template
  /// 
  /// Example:
  /// Hello, my name is {name} and I am {age} years old.
  final String _body;

  final List<Label> labels;

  Template({
    required this.title,
    required String body,
    required this.labels,
  } ) : _body = body;

  /// replace the labels in the body text with the values in [labels]
  /// Labels are enclosed in curly braces {}
  String get body {
    return _body.replaceAllMapped(RegExp(r'{([^}]+)}'), (Match m) {
      final Label? label = labels.firstWhereOrNull((label) => label.key == m.group(1));
      if (label != null) {
        return label.getText();
      } else {
        return m.group(0)!;
      }
    });
  }

  String get rawBody => _body;
}

abstract class TemplateView {}
