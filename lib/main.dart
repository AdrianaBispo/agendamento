import 'package:agenda/src/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'src/appwidget.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting().then(
    (_) => runApp(
      ModularApp(
        module: AppModule(),
        child: (const MyApp()),
      ),
    ),
  );
}
