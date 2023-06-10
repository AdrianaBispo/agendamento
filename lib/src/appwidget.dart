import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//view
import 'features/clients/home/home.dart';
//utils
import 'features/clients/home/store/clientehome_store.dart';
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
    return MultiProvider(
      providers: [
        Provider<ClienteHomeController>(create: (_) => ClienteHomeController(),)
      ],
      child: MaterialApp(
      title: 'Agendamento',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routes: {
        // AppRoutes.HOME: (context) => HomePage(),
        // AppRoutes.CLIENTES: (context) => ClientesPage(),
        // AppRoutes.PROFSSIONAIS: (context) => ProfissionaisPage(),
        '/': (context) => ClientesPage(),
      },
    ),
    );
  }
}
