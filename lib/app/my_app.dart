import 'package:demo_app/calculator/calculator_page.dart';
import 'package:demo_app/provider/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CalculatorProvider())
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: CalculatorPage()),
    );
  }
}
