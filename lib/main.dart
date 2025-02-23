import 'package:flutter/material.dart';
import 'package:mvvm_provider/utlis/routes/routes.dart';
import 'package:mvvm_provider/utlis/routes/routes_name.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: const MaterialApp(
        title: 'MVVM Tutorial',
        initialRoute: RoutesName.loign,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
