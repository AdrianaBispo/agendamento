// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente_database.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClienteDatabaseAdapter extends TypeAdapter<ClienteDatabase> {
  @override
  final int typeId = 100;

  @override
  ClienteDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ClienteDatabase(
      nome: fields[1] as String,
      sobrenome: fields[2] as String,
      telefone: fields[3] as String,
      dataNasciomento: fields[4] as String,
      email: fields[5] as String,
      historico: (fields[6] as List).cast<Historico>(),
    )..id = fields[0] as int?;
  }

  @override
  void write(BinaryWriter writer, ClienteDatabase obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nome)
      ..writeByte(2)
      ..write(obj.sobrenome)
      ..writeByte(3)
      ..write(obj.telefone)
      ..writeByte(4)
      ..write(obj.dataNasciomento)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.historico);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClienteDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
