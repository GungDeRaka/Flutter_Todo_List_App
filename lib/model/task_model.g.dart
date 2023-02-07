// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyTaskAdapter extends TypeAdapter<MyTask> {
  @override
  final int typeId = 0;

  @override
  MyTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyTask(
      fields[0] as String?,
      fields[1] as bool?,
      fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MyTask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.taskName)
      ..writeByte(1)
      ..write(obj.isDone)
      ..writeByte(2)
      ..write(obj.isRetrieved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
