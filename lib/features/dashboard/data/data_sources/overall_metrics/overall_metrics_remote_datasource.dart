import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/overall_metrics/overall_metrics_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/overall_metrics/ovarall_metrics_mapper.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/overall_metrics/overall_metrics_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/overall_metrics/overall_metrics.dart';

abstract class OverallMetricsRemoteDataSource {
  Future<AppResult<OverallMetrics>> getOverallMetricsList(
      String accountId, String projectId, String topicId, String timePeriod);
}

class OverallMetricsRemoteDataSourceImpl
    implements OverallMetricsRemoteDataSource {
  OverallMetricsRemoteService _service = sl<OverallMetricsRemoteService>();

  @override
  Future<AppResult<OverallMetrics>> getOverallMetricsList(String accountId,
      String projectId, String topicId, String timePeriod) async {
    try {
      final response = OverallMetricsResponse.fromJson(await _service
          .getOverallMetricsList(accountId, projectId, topicId, timePeriod));

      return AppResult.success(mapResponseToOverallMetric(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
