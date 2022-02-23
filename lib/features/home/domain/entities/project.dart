import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Project extends Equatable {
  final String id;
  final String name;
  final int createdDate;
  final int endDate;
  final bool active;
  final int currentNumberOfTopics;
  final int currentNumberOfPosts;

  Project({
    @required this.id,
    @required this.name,
    this.createdDate,
    this.endDate,
    this.active,
    this.currentNumberOfTopics,
    this.currentNumberOfPosts,
  });

  @override
  List<Object> get props => [
        id,
        name,
        createdDate,
        endDate,
        active,
        currentNumberOfTopics,
        currentNumberOfPosts
      ];
}
