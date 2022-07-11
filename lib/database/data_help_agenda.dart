import 'dart:async';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

import 'package:flutter/foundation.dart';
class AgendaDatabase {
  final String _dataBaseName = 'Agenda.db';
  //Singleton instance
  static final AgendaDatabase _singleton = AgendaDatabase._();

  static AgendaDatabase get instance => _singleton;


  Database? _dataBase;

  AgendaDatabase._();

  Future<Database?> get dataBase async {
    if (_dataBase != null) return _dataBase;

    _dataBase = await _openDatabase();

    return _dataBase;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    final dBPath = join(appDocumentDir.path, _dataBaseName);
    final database = await databaseFactoryIo.openDatabase(dBPath);
    return database;
  }
}
