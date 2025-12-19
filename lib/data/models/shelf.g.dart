// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Shelf _$ShelfFromJson(Map<String, dynamic> json) => _Shelf(
  id: json['id'] as String,
  name: json['name'] as String,
  roomId: json['roomId'] as String?,
  dateCreated: DateTime.parse(json['dateCreated'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  isSynced: json['isSynced'] as bool? ?? false,
);

Map<String, dynamic> _$ShelfToJson(_Shelf instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'roomId': instance.roomId,
  'dateCreated': instance.dateCreated.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'isSynced': instance.isSynced,
};
