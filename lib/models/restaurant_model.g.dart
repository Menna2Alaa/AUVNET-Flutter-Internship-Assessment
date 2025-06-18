// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RestaurantModelAdapter extends TypeAdapter<RestaurantModel> {
  @override
  final int typeId = 2;

  @override
  RestaurantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RestaurantModel(
      id: fields[0] as String,
      name: fields[1] as String,
      image: fields[2] as String,
      rating: fields[3] as double,
      category: fields[4] as String,
      isPopular: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, RestaurantModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.isPopular);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RestaurantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
