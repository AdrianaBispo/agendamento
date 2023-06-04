
import 'package:flutter/material.dart';
//view
import 'features/clients/home/home.dart';
//utils
import 'shared/utils/app_theme.dart';
// import 'view/home_page.dart';
// import 'view/clientes_page.dart';
// import 'view/profissionais_page.dart';
// import 'view/agendamento_page.dart';
//utils
// import 'utils/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendamento',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routes: {
        // AppRoutes.HOME: (context) => HomePage(),
        // AppRoutes.CLIENTES: (context) => ClientesPage(),
        // AppRoutes.PROFSSIONAIS: (context) => ProfissionaisPage(),
        '/': (context) => ClientesPage(),
      },
    );
  }
}
