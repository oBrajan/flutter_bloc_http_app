import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/helpers/date_formatter.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics_bloc.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics_event.dart';
import 'package:easy2know_flutter/features/home/presentation/pages/topics_page.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectDetailsCardDark extends StatelessWidget {
  final Account account;
  final Project project;

  const ProjectDetailsCardDark({
    Key key,
    @required this.account,
    @required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String createdDate = DateFormatter().formattedDate(project.createdDate);
    String endDate = DateFormatter().formattedDate(project.endDate);

    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(Radius.circular(4)),
          gradient: LinearGradient(
            colors: [
              AppColors.projects_color_light.withOpacity(0.9),
              AppColors.projects_color.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 1],
          ),
        ),
        height: 100,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      project.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "$createdDate - $endDate",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (project.currentNumberOfTopics > 0) {
                              BlocProvider.of<TopicsBloc>(context)
                                  .add(GetTopics(
                                account: account,
                                project: project,
                              ));

                              Navigator.of(context).pushNamed(
                                TopicsPage.namedRout,
                              );
                            }
                          },
                          child: InfoCard(
                            value: project.currentNumberOfTopics,
                            text: 'TOPICS',
                            color: AppColors.topics_color,
                          ),
                        ),
                        InfoCard(
                          value: project.currentNumberOfPosts,
                          text: 'POSTS',
                          color: AppColors.posts_color,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
