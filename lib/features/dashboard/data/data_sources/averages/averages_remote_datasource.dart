import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/averages/averages_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/averages/averages_mapper.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/averages/averages_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/averages/average.dart';

abstract class AveragesRemoteDataSource {
  Future<AppResult<Average>> getAveragesList(
      String accountId, String projectId, String topicId);
}

class AveragesRemoteDataSourceImpl implements AveragesRemoteDataSource {
  AveragesRemoteService _service = sl<AveragesRemoteService>();

  @override
  Future<AppResult<Average>> getAveragesList(
      String accountId, String projectId, String topicId) async {
    try {
      final response = AveragesResponse.fromJson(
          await _service.getAveragesList(accountId, projectId, topicId));

      return AppResult.success(mapResponseToAverages(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
