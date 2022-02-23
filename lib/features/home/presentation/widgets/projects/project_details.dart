import 'package:easy2know_flutter/features/home/domain/entities/account.dart';
import 'package:easy2know_flutter/features/home/domain/entities/project.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/projects/project_details_card_dark.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/projects/project_details_card_light.dart';
import 'package:easy2know_flutter/features/theme/app_themes.dart';
import 'package:easy2know_flutter/features/theme/bloc/theme_bloc.dart';
import 'package:easy2know_flutter/features/theme/bloc/theme_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectDetails extends StatelessWidget {
  final Account account;
  final Project project;

  const ProjectDetails({
    Key key,
    this.account,
    this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return state.themeData == appThemeData[AppTheme.Normal]
              ? ProjectDetailsCardLight(
                  account: account,
                  project: project,
                )
              : ProjectDetailsCardDark(
                  account: account,
                  project: project,
                );
        },
      ),
    );
  }
}
