import 'package:add_to_cart/add_cart/view/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white, // or any Color
      statusBarIconBrightness: Brightness.dark, // dark = black icons, light = white icons
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add to Cart Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home:AddToCart(),
    );
  }
}
