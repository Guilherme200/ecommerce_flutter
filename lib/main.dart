import 'package:ecommerce_flutter/providers/providers.dart';
import 'package:ecommerce_flutter/routes/routes.dart';
import 'package:ecommerce_flutter/utils/product_seeder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ProductSeeder.insertProducts();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) => MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.purple),
          routes: routes,
          initialRoute: "/splash",
        ),
      ),
    );
  }
}
