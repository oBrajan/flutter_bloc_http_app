import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';

class QueryDetailsCardLight extends StatelessWidget {
  final Account account;
  final Project project;
  final Topic topic;
  final Query query;

  const QueryDetailsCardLight({
    Key key,
    @required this.account,
    @required this.project,
    @required this.topic,
    @required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 100,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: AppColors.queries_color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              width: 4,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          query.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Row(
                          children: <Widget>[
                            InfoCard(
                              value: query.variations.length,
                              text: 'KEYWORDS',
                              color: AppColors.queries_color,
                            ),
                            InfoCard(
                              value: query.variations.length,
                              text: 'POSTS',
                              color: AppColors.posts_color,
                            ),
                            InfoCard(
                              value: 0,
                              text: 'GLOBAL', // TODO: Locations card
                              color: AppColors.card_background_grey,
                            ),
                            InfoCard(
                              value: 0,
                              text: 'GLOBAL', // TODO: Language card
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
          ],
        ),
      ),
    );
  }
}
