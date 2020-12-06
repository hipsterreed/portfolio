import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_portfolio/pages/dribbble_implementations/game_streaming_app/game_streaming_app_page.dart';

const MaterialColor WHITE = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: Colors.white,
    100: Colors.white,
    200: Colors.white,
    300: Colors.white,
    400: Colors.white,
    500: Colors.white,
    600: Colors.white,
    700: Colors.white,
    800: Colors.white,
    900: Colors.white,
  },
);

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return GameStreamingApp();
  }
}
