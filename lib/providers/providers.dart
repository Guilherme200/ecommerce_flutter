import 'package:ecommerce_flutter/providers/user_provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';

final List<SingleChildWidget> providers = [
  Provider<UserProvider>(create: (_) => UserProvider())
];
