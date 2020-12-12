import 'package:ecommerce_flutter/screens/home_screen.dart';
import 'package:ecommerce_flutter/screens/login_screen.dart';
import 'package:ecommerce_flutter/screens/product_detail_screen.dart';
import 'package:ecommerce_flutter/screens/products_screen.dart';
import 'package:ecommerce_flutter/screens/register_screen.dart';
import 'package:ecommerce_flutter/screens/splashScreen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  "/splash": (_) => SplashScreen(),
  "/register": (_) => RegisterScreen(),
  "/login": (_) => LoginScreen(),
  "/home": (_) => HomeScreen(),
  "/products": (_) => ProductsScreen(),
  "/products/detail": (_) => ProductDetailScreen()
};
