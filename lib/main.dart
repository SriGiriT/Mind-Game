import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory_matrix/screens/Game11.dart';
import 'package:memory_matrix/screens/Game22.dart';
import 'package:memory_matrix/screens/Game33.dart';
import 'package:memory_matrix/screens/Game44.dart';
import 'package:memory_matrix/screens/Game55.dart';
import 'package:memory_matrix/screens/Game66.dart';
import 'package:memory_matrix/screens/Settings_screen.dart';
import 'package:memory_matrix/screens/main_screen.dart';
import 'package:memory_matrix/screens/Success.dart';
import 'package:memory_matrix/screens/Wrong.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyMainScreen(),
        '/game11': (context) => Game11(),
        '/game2': (context) => Game22(),
        '/game3': (context) => Game33(),
        '/game4': (context) => Game44(),
        '/game5': (context) => Game55(),
        '/game6': (context) => Game66(),
        '/success': (context) => Success(),
        '/settings': (context) => MySettings(),
        '/wrong': (context) => Wrong(),
      },
    );
  }
}
