import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'Oregano', color: Colors.white, fontSize: 48),
          headline2:
              TextStyle(fontFamily: 'Kanit', color: Colors.white, fontSize: 28),
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
      home: const HomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        padding: const EdgeInsets.all(32),
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
            Placeholder(fallbackHeight: 200, color: Colors.white),
            const SizedBox(height: 32),
            Placeholder(fallbackHeight: 200, color: Colors.white),
            const SizedBox(height: 32),
            Placeholder(fallbackHeight: 200, color: Colors.white)
          ],
        ),
      ),
    );
  }
}
