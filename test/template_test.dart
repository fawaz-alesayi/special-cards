import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:invitation_cards/main.dart';

void main() {
  testWidgets('Labels are laid out correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(RichText), findsWidgets);
  });
}
