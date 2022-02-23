import 'package:equatable/equatable.dart';

class PostFrequency extends Equatable {
  final int count;
  final String created_time_short;

  PostFrequency({this.count, this.created_time_short});

  @override
  List<Object> get props => [count, created_time_short];
}
