// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueriesResponse _$QueriesResponseFromJson(Map<String, dynamic> json) {
  return QueriesResponse(
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : QueryData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$QueriesResponseToJson(QueriesResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

QueryData _$QueryDataFromJson(Map<String, dynamic> json) {
  return QueryData(
    id: json['id'] as String,
    name: json['name'] as String,
    locations: (json['locations'] as List)?.map((e) => e as String)?.toList(),
    languages: (json['languages'] as List)?.map((e) => e as String)?.toList(),
    included_keywords:
        (json['included_keywords'] as List)?.map((e) => e as String)?.toList(),
    excluded_keywords:
        (json['excluded_keywords'] as List)?.map((e) => e as String)?.toList(),
    variations: (json['variations'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$QueryDataToJson(QueryData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'locations': instance.locations,
      'languages': instance.languages,
      'included_keywords': instance.included_keywords,
      'excluded_keywords': instance.excluded_keywords,
      'variations': instance.variations,
    };
