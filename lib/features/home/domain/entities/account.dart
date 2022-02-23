import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Account extends Equatable {
  final String id;
  final String name;
  final String email;
  final bool active;
  final int timeCreated;
  final int dataGatheringCycle;
  final int maxNumberOfProjects;
  final int maxNumberOfTopics;
  final int maxNumberOfQueries;
  final int maxNumberOfPosts;
  final int currentNumberOfProjects;
  final int currentNumberOfTopics;
  final int currentNumberOfQueries;
  final int currentNumberOfPosts;

  Account({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.active,
    @required this.timeCreated,
    @required this.dataGatheringCycle,
    @required this.maxNumberOfProjects,
    @required this.maxNumberOfTopics,
    @required this.maxNumberOfQueries,
    @required this.maxNumberOfPosts,
    @required this.currentNumberOfProjects,
    @required this.currentNumberOfTopics,
    @required this.currentNumberOfQueries,
    @required this.currentNumberOfPosts,
  });

  @override
  List<Object> get props => [
        id,
        name,
        email,
        active,
        timeCreated,
        dataGatheringCycle,
        maxNumberOfProjects,
        maxNumberOfTopics,
        maxNumberOfQueries,
        maxNumberOfPosts,
        currentNumberOfProjects,
        currentNumberOfTopics,
        currentNumberOfQueries,
        currentNumberOfPosts
      ];
}
