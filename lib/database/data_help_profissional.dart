import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

class AppDatabase {
  final String _dataBaseName = 'Profissionais.db';
  //Singleton instance
  static final AppDatabase _singleton = AppDatabase._();

  static AppDatabase get instance => _singleton;


  Database? _dataBase;

  AppDatabase._();

  Future<Database?> get dataBase async {
    if (_dataBase != null) return _dataBase;

    _dataBase = await _openDatabase();

    return _dataBase;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dBPath = join(appDocumentDir.path, _dataBaseName);
    final database = await databaseFactoryIo.openDatabase(dBPath);
    debugPrint('database aberto');
    //print(dBPath);
    return database;
  }
}
