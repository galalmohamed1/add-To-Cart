import 'package:add_to_cart/core/routes/app_routes.dart';
import 'package:add_to_cart/core/routes/app_routes_name.dart';
import 'package:add_to_cart/features/category/logic/home_provider.dart';
import 'package:add_to_cart/features/category/view/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    ),);
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
     onGenerateRoute: AppRoutes.onGeneratedRoute,
        initialRoute: PagesRouteName.initial,
      // home:AddToCart(),
    );
  }
}
