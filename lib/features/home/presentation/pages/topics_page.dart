import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/topics/topic_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicsPage extends StatelessWidget {
  static const namedRout = '/topicsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Topics'),
      ),
      body: BlocBuilder<TopicsBloc, TopicsState>(
        builder: (c, state) {
          if (state is TopicsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is TopicsLoaded) {
            return Container(
//              color: AppColors.background_grey,
              child: ListView.builder(
                itemCount: state.topics.length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      // TODO: On Item click -> Queries
                    },
                    child: TopicDetails(
                      account: state.account,
                      project: state.project,
                      topic: state.topics[index],
                    ),
                  );
                },
              ),
            );
          } else if (state is TopicsError) {
            return Text(state.message);
          }
          return Center();
        },
      ),
    );
  }
}
