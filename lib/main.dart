import 'package:flutter/material.dart';
import 'package:invitation_cards/routes/home.dart';
import 'package:invitation_cards/routes/template.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/template': (context) => const TemplatePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
