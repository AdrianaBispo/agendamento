import 'package:agenda/const/colors.dart';
import 'package:agenda/view/clientes.dart';
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
        fontFamily: 'Montserrat',
        primaryColor: AppColor.blue,//para os botoes
      ),
      routes: {
        AppRoutes.HOME: (context) => HomePage(),
        AppRoutes.CLIENTES: (context) => ClientesPage(),
      },
    );
  }
}
