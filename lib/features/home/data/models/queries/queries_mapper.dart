import 'package:easy2know_flutter/features/home/data/models/queries/queries_response.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';

List<Query> mapResponseToQuery(QueriesResponse response) {
  List<Query> list = new List<Query>();

  response.data.forEach((element) {
    list.add(Query(
      id: element.id,
      name: element.name,
      locations: element.locations,
      languages: element.languages,
      includedKeywords: element.included_keywords,
      excludedKeywords: element.excluded_keywords,
      variations: element.variations,
    ));
  });

  return list;
}
