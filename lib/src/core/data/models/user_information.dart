import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:standered_application/src/infrastructure/storage/hive/hive_type_ids.dart';

part 'user_information.g.dart';

UserInformation userInformationFromJson(String str) =>
    UserInformation.fromJson(json.decode(str));

String userInformationToJson(UserInformation data) =>
    json.encode(data.toJson());

@HiveType(typeId: HiveTypeIds.userInfoTypId)
@JsonSerializable()
class UserInformation extends HiveObject implements EquatableMixin {
  @HiveField(1)
  @JsonKey(name: "id")
  final int id;
  @HiveField(3)
  @JsonKey(name: "full_name")
  final String? name;

  @HiveField(7)
  @JsonKey(name: "location")
  final String location;
  @HiveField(8)
  @JsonKey(name: "phone")
  final String phoneNumber;
  @HiveField(9)
  @JsonKey(name: "fcm_token")
  final String fcmToken;

  @HiveField(10)
  @JsonKey(name: "image")
  final String? image;

  UserInformation({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.location,
    required this.fcmToken,
    required this.image,
  });

  factory UserInformation.fromJson(Map<String, dynamic> json) =>
      _$UserInformationFromJson(json);

  Map<String, dynamic> toJson() => _$UserInformationToJson(this);
  static UserInformation defaultValue = UserInformation(
    id: -1,
    name: '',
    location: '',
    phoneNumber: "",
    fcmToken: "",
    image: null,
  );
  @override
  bool operator ==(covariant UserInformation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.location == location &&
        other.phoneNumber == phoneNumber &&
        other.fcmToken == fcmToken &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phoneNumber.hashCode ^
        location.hashCode ^
        fcmToken.hashCode ^
        image.hashCode;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        location,
        phoneNumber,
        fcmToken,
        image,
      ];

  @override
  bool? get stringify => true;

  UserInformation copyWith({
    int? id,
    String? name,
    String? location,
    String? phoneNumber,
    String? fcmToken,
    String? image,
  }) {
    return UserInformation(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      fcmToken: fcmToken ?? this.fcmToken,
      image: image ?? this.image,
    );
  }
}
