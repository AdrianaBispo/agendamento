import 'package:flutter/material.dart';
//view
import 'view/home_page.dart'; 
//routes
import 'utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME: (context) => HomePage(),
      },
    );
  }
}
