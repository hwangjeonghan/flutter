// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NumberItem.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NumberItemAdapter extends TypeAdapter<NumberItem> {
  @override
  final int typeId = 0;

  @override
  NumberItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NumberItem(
      title: fields[0] as String?,
      description: fields[1] as String?,
      phoneNumber: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, NumberItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NumberItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
