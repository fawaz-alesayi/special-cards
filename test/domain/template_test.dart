import 'package:flutter_test/flutter_test.dart';
import 'package:invitation_cards/domain/labels.dart';
import 'package:invitation_cards/domain/template.dart';

void main() {
  test(
      "Given a template, when I provide some labels, then the labels in the body text are replaced by the labels that I provided",
      () {
    Template t = Template(
        title: "Hi",
        body: "Hello {name}, how are you?",
        labels: [TextLabel(key: "name", value: "John")]);

    expect(t.body, "Hello John, how are you?");
  });

  test(
      "Given a template AND template does not contain the labels that I provide, when I provide some labels, then the body text is returned as is",
      () {
    Template t = Template(
        title: "Hi",
        body: "Hello {age}, how are you?",
        labels: [TextLabel(key: "name", value: "John")]);

    expect(t.body, "Hello {age}, how are you?");
  });
}
