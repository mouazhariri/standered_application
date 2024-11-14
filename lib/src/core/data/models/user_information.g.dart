// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_information.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInformationAdapter extends TypeAdapter<UserInformation> {
  @override
  final int typeId = 1;

  @override
  UserInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInformation(
      id: fields[1] as int,
      name: fields[3] as String?,
      phoneNumber: fields[8] as String,
      location: fields[7] as String,
      fcmToken: fields[9] as String,
      image: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInformation obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.location)
      ..writeByte(8)
      ..write(obj.phoneNumber)
      ..writeByte(9)
      ..write(obj.fcmToken)
      ..writeByte(10)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInformation _$UserInformationFromJson(Map<String, dynamic> json) =>
    UserInformation(
      id: (json['id'] as num).toInt(),
      name: json['full_name'] as String?,
      phoneNumber: json['phone'] as String,
      location: json['location'] as String,
      fcmToken: json['fcm_token'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UserInformationToJson(UserInformation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.name,
      'location': instance.location,
      'phone': instance.phoneNumber,
      'fcm_token': instance.fcmToken,
      'image': instance.image,
    };
