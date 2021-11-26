import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';
import '../utils/card_provider.dart';
import '../pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CardProvider(),
    child: const TinderDemoApp(),
  ));
}

class TinderDemoApp extends StatelessWidget {
  const TinderDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Tinder Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: primaryColor,
          appBarTheme:
              const AppBarTheme(backgroundColor: primaryColor, elevation: 0.0)),
      home: const HomePage(),
    );
  }
}
