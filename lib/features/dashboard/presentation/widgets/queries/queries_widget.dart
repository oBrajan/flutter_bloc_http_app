import 'package:easy2know_flutter/features/dashboard/presentation/manager/queries_bloc/dashboard_queries.dart';
import 'package:easy2know_flutter/features/dashboard/presentation/widgets/queries/queries_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QueriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardQueriesBloc, DashboardQueriesState>(
        builder: (context, state) {
      if (state is QueriesDataLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is QueriesDataLoaded) {
        return Container(
//              color: AppColors.background_grey,
          child: ListView.builder(
            itemCount: state.query.length,
            itemBuilder: (context, index) {
              return new GestureDetector(
                onTap: () {
                  // TODO: On Item click -> Queries
                },
                child: QueriesDetailsCard(
                  queries: state.query,
                ),
              );
            },
          ),
        );
      }
      if (state is QueriesDataEmpty) {
        return Center(
          child: Text('Empty'),
        );
      }

      return Center(
        child: Text(''),
      );
    });
  }
}
