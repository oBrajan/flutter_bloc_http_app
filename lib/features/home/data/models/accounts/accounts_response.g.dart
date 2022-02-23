// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountsResponse _$AccountsResponseFromJson(Map<String, dynamic> json) {
  return AccountsResponse(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : AccountDataResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountsResponseToJson(AccountsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AccountDataResponse _$AccountDataResponseFromJson(Map<String, dynamic> json) {
  return AccountDataResponse(
    id: json['_id'] as String,
    name: json['name'] as String,
    email: json['email'] as String,
    active: json['active'] as bool,
    time_created: (json['time_created'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$AccountDataResponseToJson(
        AccountDataResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'active': instance.active,
      'time_created': instance.time_created,
    };
