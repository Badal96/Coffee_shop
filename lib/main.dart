import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/pages/get_started_page.dart';

import 'package:flutter/material.dart';

import 'home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.appBrown),
        useMaterial3: true,
      ),
      home: const GetStartedPage(),
      routes: {'homepage': (context) => const HomePage()},
    );
  }
}
