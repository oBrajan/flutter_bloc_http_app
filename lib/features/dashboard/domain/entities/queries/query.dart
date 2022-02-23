import 'package:equatable/equatable.dart';

class Query extends Equatable {
  final int count;
  final int reach;
  final int engagement;
  final String query_name;

  Query({this.count, this.reach, this.engagement, this.query_name});

  @override
  List<Object> get props => [count, reach, engagement, query_name];
}
