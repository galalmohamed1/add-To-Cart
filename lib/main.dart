import 'package:add_to_cart/core/routes/app_routes.dart';
import 'package:add_to_cart/core/routes/app_routes_name.dart';
import 'package:add_to_cart/features/category/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // or any Color
      statusBarIconBrightness: Brightness.dark, // dark = black icons, light = white icons
    ),
  );
  print('object');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => HomeCubit()..getCategoriesData())],
      child: MaterialApp(
        title: 'Add to Cart Example',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: AppRoutes.onGeneratedRoute,
        initialRoute: PagesRouteName.initial,
        // home:AddToCart(),
      ),
    );
  }
}
