import 'dart:developer';
import 'package:add_to_cart/features/category/view/category_screen.dart';
import 'package:add_to_cart/features/category/view/shopping/shopping_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_routes_name.dart';

abstract class AppRoutes {
  static Route onGeneratedRoute(RouteSettings settings) {
    log('Route: ${settings.name}');
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const AddToCart(),
          settings: settings,
        );

      case PagesRouteName.ShoppingScreen:
        return MaterialPageRoute(
          builder: (context) =>  ShoppingScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const AddToCart(),
          settings: settings,
        );
    }
  }
}