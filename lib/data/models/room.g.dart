// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['id'] as String,
  name: json['name'] as String,
  dateCreated: DateTime.parse(json['dateCreated'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'dateCreated': instance.dateCreated.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};
