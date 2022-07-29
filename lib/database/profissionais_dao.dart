import 'package:sembast/sembast.dart';
import 'package:sembast/utils/value_utils.dart';
import '../models/profissional.dart';
import 'data_help_profissional.dart';
import 'package:flutter/foundation.dart';

class ProfissionalDAO {
  
  final _profissionalStore = intMapStoreFactory.store('profissionals');

  Future<Database?> get _db async => await AppDatabase.instance.dataBase;

  insert(Profissional profissional) async {
    var db = await _db as Database;
    var find = Finder(
      filter: Filter.equals("id", null),
    );

    await db.transaction(
      (txn) async {
        // Add the object, get the auto incremented id
        var key = await _profissionalStore.add(txn, profissional.toJson());
        // Set the Id in our object
        await _profissionalStore.update(txn, {'id': key}, finder: find);
      },
    );
  }

  Future <List<Profissional>> getAllProfissionais() async {
    //read
    // Finder object can also sort data.
    final finder = Finder(sortOrders: [//order alfabetica
      SortOrder('name'),
    ]);

    final recordSnapshots = await _profissionalStore.find(
      await _db as Database,
      finder: finder,
    );
    // Making a List<Profissional> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      return Profissional.fromJson(snapshot.value);
    }).toList();
  }

  getEpecificKey({required int id}) async {
    final find = Finder(filter: Filter.equals('id', id));

    var db = await _db as Database;
    var map = await _profissionalStore.query(finder: find).getSnapshot(db);
    var servicos = cloneValue(map);

    return servicos.map((snapshot) {
      final profissionals = Profissional.fromJson(snapshot.value);
      // An ID is a key of a record from the database.
      //fruit.id = snapshot.key;
      return profissionals;
    }).toList();

  }

  Future updateProfissional(int id, Profissional profissional) async {
    //update
    profissional.id = id;
    final find = Finder(filter: Filter.equals('id', id));

    var db = await _db as Database;
    await _profissionalStore.update(db, profissional.toJson(), finder: find);

    await _profissionalStore.query(finder: find).getSnapshot(db);
  }

  Future deleteProfissional({required int id}) async {
    final find = Finder(filter: Filter.equals('id', id));
    var db = await _db as Database;
    await _profissionalStore.delete(db, finder: find);
  }

}