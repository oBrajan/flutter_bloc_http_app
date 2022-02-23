import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/domain/entities/query.dart';
import 'package:easy2know_flutter/features/home/domain/entities/topic.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/queries/query_details_card_light.dart';
import 'package:easy2know_flutter/features/theme/app_themes.dart';
import 'package:easy2know_flutter/features/theme/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueryDetails extends StatelessWidget {
  final Account account;
  final Project project;
  final Topic topic;
  final Query query;

  const QueryDetails({
    Key key,
    @required this.account,
    @required this.project,
    @required this.topic,
    @required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return state.themeData == appThemeData[AppTheme.Normal]
              ? QueryDetailsCardLight(
                  account: account,
                  project: project,
                  topic: topic,
                  query: query,
                )
              : QueryDetailsCardLight(
                  account: account,
                  project: project,
                  topic: topic,
                  query: query,
                );
        },
      ),
    );
  }
}
