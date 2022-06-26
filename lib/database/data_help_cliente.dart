import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

import 'package:flutter/foundation.dart';
class ClienteDatabase {
  final String _dataBaseName = 'Clientes.db';
  //Singleton instance
  static final ClienteDatabase _singleton = ClienteDatabase._();

  static ClienteDatabase get instance => _singleton;


  Database? _dataBase;

  ClienteDatabase._();

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
    return database;
  }
}
