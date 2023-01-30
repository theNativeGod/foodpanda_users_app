import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:foodpanda_users_app/models/orders.dart';
import 'package:foodpanda_users_app/screens/main_screens/order_screen.dart';
import 'package:foodpanda_users_app/screens/main_screens/shipment_address_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './global/global.dart';
import './models/cart.dart';

import './screens/splash_screen/splash_screen.dart';
import './screens/main_screens/cart_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'FoodPanda Users',
        theme: ThemeData(primarySwatch: Colors.red),
        home: const SplashScreen(),
      ),
    );
  }
}
