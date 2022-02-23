import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GeneralInformation extends Equatable {
  final int number_of_queries;
  final int number_of_posts;
  final List<String> locations;
  final List<String> languages;
  final int start_date_for_time_period;
  final double end_date_for_time_period;

  GeneralInformation({
    @required this.number_of_queries,
    @required this.number_of_posts,
    @required this.locations,
    @required this.languages,
    @required this.start_date_for_time_period,
    @required this.end_date_for_time_period,
  });

  @override
  List<Object> get props => [
        number_of_queries,
        number_of_posts,
        locations,
        languages,
        start_date_for_time_period,
        end_date_for_time_period,
      ];
}
