import 'package:flutter/material.dart';
import 'package:flutter_assigment/screen/home/controller/homeviewcontroller.dart';
import 'package:flutter_assigment/screen/home/view/home_view.dart';
import 'package:flutter_assigment/screen/profile/controller/profile_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Homeviewcontroller()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeView()
    );
  }
}
