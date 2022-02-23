import 'package:easy2know_flutter/features/dashboard/data/models/queries/queries_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/queries/query.dart';

List<Query> mapResponseToQuery(QueriesResponse response) {
  List<Query> list = new List<Query>();

  response.data.forEach((element) {
    list.add(Query(
      count: element.count,
      reach: element.reach,
      engagement: element.engagement,
      query_name: element.query_name,
    ));
  });

  return list;
}
