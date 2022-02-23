import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Topic extends Equatable {
  final String id;
  final String name;
  final List<String> locations;
  final List<String> languages;
  final int startDate;
  final int endDate;
  final int currentNumberOfQueries;
  final int currentNumberOfPosts;

  Topic({
    @required this.id,
    @required this.name,
    this.locations,
    this.languages,
    this.startDate,
    this.endDate,
    this.currentNumberOfQueries,
    this.currentNumberOfPosts,
  });

  @override
  List<Object> get props => [
        id,
        name,
        locations,
        languages,
        startDate,
        endDate,
        currentNumberOfQueries,
        currentNumberOfPosts,
      ];
}
