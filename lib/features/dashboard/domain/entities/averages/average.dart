import 'package:equatable/equatable.dart';

class Average extends Equatable {
  final AverageData day;
  final AverageData week;
  final AverageData month;

  Average({this.day, this.week, this.month});

  @override
  List<Object> get props => [day, week, month];
}
class AverageData extends Equatable {
  final double numberOfPosts;
  final double reach;
  final double engagement;

  AverageData({this.numberOfPosts, this.reach, this.engagement});

  @override
  List<Object> get props => [numberOfPosts, reach, engagement];
}
