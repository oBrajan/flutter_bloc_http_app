import 'package:easy2know_flutter/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/projects_bloc/projects.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics_bloc.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/drawer/app_drawer.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/projects/project_details.dart';
import 'package:easy2know_flutter/features/theme/presentation/themes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Themes',
            icon: Icon(Icons.wb_sunny),
            onPressed: () =>
                Navigator.of(context).pushNamed(ThemesScreen.namedRout),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: BlocBuilder<ProjectsBloc, ProjectsState>(
        builder: (c, state) {
          if (state is ProjectsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProjectsLoaded) {
            return Container(
//              color: AppColors.background_grey,
              child: ListView.builder(
                itemCount: state.projects.length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      if (state.projects[index].currentNumberOfTopics > 0) {
                        BlocProvider.of<TopicsBloc>(context).add(GetTopics(
                          account: state.account,
                          project: state.projects[index],
                        ));

                        Navigator.of(context).pushNamed(
                          DashboardPage.namedRout,
                          arguments: 0,
                        );
                      }
                    },
                    child: ProjectDetails(
                      account: state.account,
                      project: state.projects[index],
                    ),
                  );
                },
              ),
            );
          } else if (state is ProjectsError) {
            return Text(state.message);
          }
          return Center();
        },
      ),
    );
  }
}
