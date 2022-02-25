import 'package:flutter/material.dart';
import 'package:invitation_cards/template.dart';

import 'domain/labels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Special Cards',
      theme: ThemeData(
        hintColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.yellowAccent),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Oregano', color: Colors.white, fontSize: 48),
          headline2:
              TextStyle(fontFamily: 'Kanit', color: Colors.white, fontSize: 28),
          headline3: TextStyle(
              fontFamily: 'Oregano',
              color: Colors.white,
              fontStyle: FontStyle.italic),
          bodyText1:
              TextStyle(fontFamily: 'Kanit', color: Colors.white, fontSize: 18),
        ),
        primarySwatch: const MaterialColor(0xFF390099, {
          50: Color(0xFFE7E0F3),
          100: Color(0xFFC4B3E0),
          200: Color(0xFF9C80CC),
          300: Color(0xFF744DB8),
          400: Color(0xFF5726A8),
          500: Color(0xFF390099),
          600: Color(0xFF330091),
          700: Color(0xFF2C0086),
          800: Color(0xFF24007C),
          900: Color(0xFF17006B),
        }),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  'Special Invitations!',
                  style: Theme.of(context).textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  'Choose your template',
                  style: Theme.of(context).textTheme.headline2,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 32),
            TemplateCard(
                body: "I would be happy to see you at {Time} and {Place}",
                labels: [TextLabel(value: 'Time'), TextLabel(value: 'Place')]),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
