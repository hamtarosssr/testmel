import 'package:flutter/material.dart';
import 'package:testmel/testhome.dart';
import '/introapp/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showhome = prefs.getBool('intro') ?? false;
  runApp(MyApp(showhome: false));
}

class MyApp extends StatelessWidget {
  final bool showhome;

  const MyApp({Key? key, required this.showhome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: showhome ? HomePage() : Intro(),
    );
  }
}
