import 'package:easy2know_flutter/core/data/app_result.dart';
import 'package:easy2know_flutter/core/error/exceptions.dart';
import 'package:easy2know_flutter/di/injection_container.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/general_information/general_information_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/general_information/general_information_mapper.dart';
import 'package:easy2know_flutter/features/dashboard/data/models/general_information/general_information_response.dart';
import 'package:easy2know_flutter/features/dashboard/domain/entities/general_information/general_information.dart';

abstract class GeneralInformationRemoteDataSource {
  Future<AppResult<GeneralInformation>> getGeneralInformationList(
      String accountId, String projectId, String topicId, String timePeriod);
}

class GeneralInformationRemoteDataSourceImpl
    implements GeneralInformationRemoteDataSource {
  GeneralInformationRemoteService _service =
      sl<GeneralInformationRemoteService>();

  @override
  Future<AppResult<GeneralInformation>> getGeneralInformationList(String accountId,
      String projectId, String topicId, String timePeriod) async {
    try {
      final response = GeneralInformationResponse.fromJson(
          await _service.getGeneralInformationList(
              accountId, projectId, topicId, timePeriod));

      return AppResult.success(mapResponseToGeneralInformation(response));
    } on ServerException catch (e) {
      return AppResult.failure(e.message);
    } on NetworkException catch (e) {
      return AppResult.failure(e.message);
    } catch (e) {
      return AppResult.failure(e.toString());
    }
  }
}
