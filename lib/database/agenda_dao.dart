import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';
import '../models/agenda.dart';
import 'data_help_agenda.dart';
import 'package:flutter/foundation.dart';

class AgendaDAO {
  final _agendaStore = intMapStoreFactory.store('agenda');

  Future<Database?> get _db async => await AgendaDatabase.instance.dataBase;

  insert(Agenda agenda) async {
    var db = await _db as Database;
    var find = Finder(
      filter: Filter.equals("id", null),
    );

    await db.transaction(
      (txn) async {
        // Add the object, get the auto incremented id
        var key = await _agendaStore.add(txn, agenda.toJson());
        // Set the Id in our object
        await _agendaStore.update(txn, {'id': key}, finder: find);
      },
    );
  }

  Future<List<Agenda>> getAllAgendas() async {
    //read
    final recordSnapshots = await _agendaStore.find(
      await _db as Database,
    );
    // Making a List<Agenda> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      return Agenda.fromJson(snapshot.value);
    }).toList();
  }

  Future updateAgenda(int id, Agenda agenda) async {
    //update
    agenda.id = id;
    final find = Finder(filter: Filter.equals('id', id));

    var db = await _db as Database;
    await _agendaStore.update(db, agenda.toJson(), finder: find);

    await _agendaStore.query(finder: find).getSnapshot(db);
  }

  Future deleteAgenda({required int id}) async {
    final find = Finder(filter: Filter.equals('id', id));
    var db = await _db as Database;
    await _agendaStore.delete(db, finder: find);
  }
}
