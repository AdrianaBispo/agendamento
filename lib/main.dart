import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:agenda/app_module.dart';
import 'package:agenda/appwidget.dart';

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
