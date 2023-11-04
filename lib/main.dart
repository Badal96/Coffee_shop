import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/pages/get_started/get_started_page.dart';
import 'package:coffee_shop/providers/coffee_provider.dart';
import 'package:coffee_shop/providers/favourit_list_provider.dart';
import 'package:coffee_shop/providers/filter_provider.dart';
import 'package:coffee_shop/providers/user_data_provider.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'home_page/home_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolors.appBrown),
        useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CoffeProvider>(
            lazy: false,
            create: (_) => CoffeProvider()..getCoffeList(),
          ),
          ChangeNotifierProvider<FilterProvider>(
            create: (context) => FilterProvider(),
          ),
          ChangeNotifierProvider<UserdataProvider>(
              create: (context) => UserdataProvider()..getuser()),
          ChangeNotifierProvider<FavouritListProvider>(
            create: (context) => FavouritListProvider(),
          ),
        ],
        builder: (context, child) => const GetStartedPage(),
      ),
      routes: {
        'homepage': (context) => const HomePage(),
      },
    );
  }
}
