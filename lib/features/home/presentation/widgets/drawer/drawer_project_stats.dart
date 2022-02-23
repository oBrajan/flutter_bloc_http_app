import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/projects_bloc/projects.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/drawer/stats_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      builder: (context, state) {
        if (state is ProjectsLoaded) {
          Account account = state.account;
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                ProjectStatsBar(
                  currentValue: account.currentNumberOfProjects,
                  maxValue: account.maxNumberOfProjects,
                  valueName: 'Projects',
                  color: AppColors.projects_color,
                ),
                SizedBox(height: 16),
                ProjectStatsBar(
                  currentValue: account.currentNumberOfTopics,
                  maxValue: account.maxNumberOfTopics,
                  valueName: 'Topics',
                  color: AppColors.topics_color,
                ),
                SizedBox(height: 16),
                ProjectStatsBar(
                  currentValue: account.currentNumberOfQueries,
                  maxValue: account.maxNumberOfQueries,
                  valueName: 'Queries',
                  color: AppColors.queries_color,
                ),
                SizedBox(height: 16),
                ProjectStatsBar(
                  currentValue: account.currentNumberOfPosts,
                  maxValue: account.maxNumberOfPosts,
                  valueName: 'Posts',
                  color: AppColors.posts_color,
                ),
              ],
            ),
          );
        }
        return Center();
      },
    );
  }
}
