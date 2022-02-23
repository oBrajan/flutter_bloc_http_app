import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/core/helpers/date_formatter.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/queries_bloc/queries.dart';
import 'package:easy2know_flutter/features/home/presentation/pages/queries_page.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicDetailsCardDark extends StatelessWidget {
  final Account account;
  final Project project;
  final Topic topic;

  const TopicDetailsCardDark({
    Key key,
    @required this.account,
    @required this.project,
    @required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String startDate = DateFormatter().formattedDate(topic.startDate);
    String endDate = DateFormatter().formattedDate(topic.endDate);

    return Card(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(Radius.circular(4)),
          gradient: LinearGradient(
            colors: [
              AppColors.projects_color_light.withOpacity(0.9),
              AppColors.topics_color.withOpacity(0.9),
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
                      topic.name,
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
                      "$startDate - $endDate",
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
                              BlocProvider.of<QueriesBloc>(context)
                                  .add(GetQueries(
                                account: account,
                                project: project,
                                topic: topic,
                              ));

                              Navigator.of(context).pushNamed(
                                QueriesPage.namedRout,
                              );
                            }
                          },
                          child: InfoCard(
                            value: topic.currentNumberOfQueries,
                            text: 'QUERIES',
                            color: AppColors.topics_color,
                          ),
                        ),
                        InfoCard(
                          value: topic.currentNumberOfPosts,
                          text: 'POSTS',
                          color: AppColors.posts_color,
                        ),
                        InfoCard(
                          value: 0,
                          text: 'GLOBAL', // TODO: Language card
                          color: AppColors.card_background_grey,
                        ),
                        InfoCard(
                          value: 0,
                          text: 'GLOBAL', // TODO: Locations card
                          color: AppColors.card_background_grey,
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
