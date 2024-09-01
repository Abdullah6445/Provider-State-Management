import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managemt_provider/controller/count_controller.dart';

import 'controller/list_controller.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CountController(),
        ),
      ],

      // providers: [
      //   ChangeNotifierProvider(
      //     create: (context) => ListController(),
      //   ),
      // ],
      child: MaterialApp(
        title: 'StateManagement',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
          useMaterial3: false,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
