import 'package:easy2know_flutter/features/home/presentation/manager/queries_bloc/queries.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/queries/query_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueriesPage extends StatelessWidget {
  static const namedRout = '/queriesPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Queries'),
      ),
      body: BlocBuilder<QueriesBloc, QueriesState>(
        builder: (context, state) {
          if (state is QueriesLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is QueriesError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is QueriesLoaded) {
            return Container(
//              color: AppColors.background_grey,
              child: ListView.builder(
                itemCount: state.queries.length,
                itemBuilder: (context, index) {
                  return new GestureDetector(
                    onTap: () {
                      // TODO: On Item click -> Queries
                    },
                    child: QueryDetails(
                      account: state.account,
                      project: state.project,
                      topic: state.topic,
                      query: state.queries[index],
                    ),
                  );
                },
              ),
            );
          }
          return Center();
        },
      ),
    );
  }
}
