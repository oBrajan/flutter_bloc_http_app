import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:easy2know_flutter/core/network/http_manager.dart';
import 'package:easy2know_flutter/features/auth/domain/use_cases/reset_password_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/averages/averages_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/averages/averages_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/general_information/general_information_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/general_information/general_information_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/overall_metrics/overall_metrics_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/overall_metrics/overall_metrics_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/posts/posts_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/posts/posts_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/posts_frequency/posts_frequency_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/posts_frequency/posts_frequency_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/queries/queries_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/queries/queries_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/sentiment_by_source/sentiment_by_source_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/sentiment_by_source/sentiment_by_source_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/top_influencer/top_influencer_remote_datasource.dart';
import 'package:easy2know_flutter/features/dashboard/data/data_sources/top_influencer/top_influencer_remote_service.dart';
import 'package:easy2know_flutter/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:easy2know_flutter/features/dashboard/data/repositories/posts_repository_impl.dart';
import 'package:easy2know_flutter/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:easy2know_flutter/features/dashboard/domain/repositories/posts_repository.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/dashboard/get_averages_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/dashboard/get_general_information_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/dashboard/get_overall_metrics_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/dashboard/get_queries_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/dashboard/get_sentiment_by_source_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/dashboard/get_top_influencer_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/posts/get_posts_frequency_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/domain/use_cases/posts/get_posts_usecase.dart';
import 'package:easy2know_flutter/features/dashboard/presentation/manager/dashboard_bloc/dashboard_bloc.dart';
import 'package:easy2know_flutter/features/home/data/local/accounts_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/local/projects_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/local/queries_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/local/topics_local_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/accounts/accounts_remote_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/accounts/accounts_remote_service.dart';
import 'package:easy2know_flutter/features/home/data/remote/projects/projects_remote_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/projects/projects_remote_service.dart';
import 'package:easy2know_flutter/features/home/data/remote/queries/queries_remote_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/queries/queries_remote_service.dart';
import 'package:easy2know_flutter/features/home/data/remote/topics/topics_remote_datasource.dart';
import 'package:easy2know_flutter/features/home/data/remote/topics/topics_remote_service.dart';
import 'package:easy2know_flutter/features/home/data/repositories/accounts_repository_impl.dart';
import 'package:easy2know_flutter/features/home/data/repositories/projects_repository_impl.dart';
import 'package:easy2know_flutter/features/home/data/repositories/queries_repository_impl.dart';
import 'package:easy2know_flutter/features/home/data/repositories/topics_repository_impl.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/accounts_repository.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/projects_repository.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/queries_repository.dart';
import 'package:easy2know_flutter/features/home/domain/repositories/topics_repository.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_account_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_project_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_projects_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_queries_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_query_details_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_topic_details_usecase.dart';
import 'package:easy2know_flutter/features/home/domain/use_cases/get_topics_usecase.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/accounts_bloc/accounts_bloc.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/projects_bloc/projects.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/queries_bloc/queries_bloc.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:easy2know_flutter/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:easy2know_flutter/features/auth/domain/repositories/auth_repository.dart';
import 'package:easy2know_flutter/features/auth/domain/use_cases/get_user.dart';
import 'package:easy2know_flutter/features/auth/domain/use_cases/is_user_logged_in.dart';
import 'package:easy2know_flutter/features/auth/presentation/manager/auth_bloc/auth.dart';
import 'package:easy2know_flutter/features/auth/presentation/manager/login_bloc/login.dart';
import 'package:easy2know_flutter/core/constants/constants.dart';
import 'package:easy2know_flutter/features/theme/bloc/theme.dart';
import 'package:flutter_auth0/flutter_auth0.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/network_info.dart';
import '../features/auth/data/data_sources/cached_user_data_source.dart';
import '../features/auth/data/data_sources/auth0_data_source.dart';
import '../features/auth/domain/use_cases/login.dart';
import '../features/auth/domain/use_cases/logout.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Blocs
  sl.registerFactory(() => AuthBloc());
  sl.registerFactory(() => LoginBloc());
  sl.registerFactory(() => ThemeBloc());
  sl.registerFactory(() => AccountsBloc());
  sl.registerFactory(() => ProjectsBloc());
  sl.registerFactory(() => TopicsBloc());
  sl.registerFactory(() => QueriesBloc());
  sl.registerFactory(() => DashboardBloc(topicsBloc: sl()));

  //! Use cases
  sl.registerLazySingleton(() => Login());
  sl.registerLazySingleton(() => Logout());
  sl.registerLazySingleton(() => GetUser());
  sl.registerLazySingleton(() => IsUserLoggedIn());
  sl.registerLazySingleton(() => ResetPasswordUseCase());
  sl.registerLazySingleton(() => GetAccountUseCase());
  sl.registerLazySingleton(() => GetProjectsUseCase());
  sl.registerLazySingleton(() => GetProjectUseCase());
  sl.registerLazySingleton(() => GetTopicsUseCase());
  sl.registerLazySingleton(() => GetTopicDetailsUseCase());
  sl.registerLazySingleton(() => GetQueriesUseCase());
  sl.registerLazySingleton(() => GetQueryDetailsUseCase());
  sl.registerLazySingleton(() => GetAveragesUseCase());
  sl.registerLazySingleton(() => GetGeneralInformationUseCase());
  sl.registerLazySingleton(() => GetOverallMetricsUseCase());
  sl.registerLazySingleton(() => GetDashQueriesUseCase());
  sl.registerLazySingleton(() => GetSentimentBySourceUseCase());
  sl.registerLazySingleton(() => GetTopInfluencerUseCase());
  sl.registerLazySingleton(() => GetPostsUseCase());
  sl.registerLazySingleton(() => GetPostsFrequencyUseCase());

  //! Repos
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  sl.registerLazySingleton<AccountsRepository>(() => AccountsRepositoryImp());
  sl.registerLazySingleton<ProjectsRepository>(() => ProjectsRepositoryImpl());
  sl.registerLazySingleton<TopicsRepository>(() => TopicsRepositoryImpl());
  sl.registerLazySingleton<QueriesRepository>(() => QueriesRepositoryImpl());
  sl.registerLazySingleton<DashboardRepository>(
      () => DashboardRepositoryImpl());
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryImpl());

  //! Data sources
  sl.registerLazySingleton<CachedUserDataSource>(
      () => CachedUserDataSourceImpl());
  sl.registerLazySingleton<Auth0DataSource>(() => Auth0DataSourceImpl());
  sl.registerLazySingleton<AccountsRemoteDataSource>(
      () => AccountsRemoteDataSourceImpl());
  sl.registerLazySingleton<AccountsLocalDataSource>(
      () => AccountsLocalDataSourceImpl());
  sl.registerLazySingleton<ProjectsRemoteDataSource>(
      () => ProjectsRemoteDataSourceImpl());
  sl.registerLazySingleton<ProjectsLocalDataSource>(
      () => ProjectsLocalDataSourceImpl());
  sl.registerLazySingleton<TopicsRemoteDataSource>(
      () => TopicsRemoteDataSourceImpl());
  sl.registerLazySingleton<TopicsLocalDataSource>(
      () => TopicsLocalDataSourceImpl());
  sl.registerLazySingleton<QueriesRemoteDataSource>(
      () => QueriesRemoteDataSourceImpl());
  sl.registerLazySingleton<QueriesLocalDataSource>(
      () => QueriesLocalDataSourceImpl());
  sl.registerLazySingleton<AveragesRemoteDataSource>(
      () => AveragesRemoteDataSourceImpl());
  sl.registerLazySingleton<GeneralInformationRemoteDataSource>(
      () => GeneralInformationRemoteDataSourceImpl());
  sl.registerLazySingleton<OverallMetricsRemoteDataSource>(
      () => OverallMetricsRemoteDataSourceImpl());
  sl.registerLazySingleton<PostsRemoteDataSource>(
      () => PostsRemoteDataSourceImpl());
  sl.registerLazySingleton<PostsFrequencyRemoteDataSource>(
      () => PostsFrequencyRemoteDataSourceImpl());
  sl.registerLazySingleton<QueriesDashRemoteDataSource>(
      () => QueriesDashRemoteDataSourceImpl());
  sl.registerLazySingleton<SentimentBySourceRemoteDataSource>(
      () => SentimentBySourceRemoteDataSourceImpl());
  sl.registerLazySingleton<TopInfluencerRemoteDataSource>(
      () => TopInfluencerRemoteDataSourceImpl());

  //! Remote Services
  sl.registerLazySingleton<AccountsRemoteService>(
      () => AccountsRemoteServiceImpl());
  sl.registerLazySingleton<ProjectsRemoteService>(
      () => ProjectsRemoteServiceImpl());
  sl.registerLazySingleton<TopicsRemoteService>(
      () => TopicsRemoteServiceImpl());
  sl.registerLazySingleton<QueriesRemoteService>(
      () => QueriesRemoteServiceImpl());
  sl.registerLazySingleton<AveragesRemoteService>(
      () => AveragesRemoteServiceImpl());
  sl.registerLazySingleton<GeneralInformationRemoteService>(
      () => GeneralInformationRemoteServiceImpl());
  sl.registerLazySingleton<OverallMetricsRemoteService>(
      () => OverallMetricsRemoteServiceImpl());
  sl.registerLazySingleton<PostsRemoteService>(() => PostsRemoteServiceImpl());
  sl.registerLazySingleton<PostsFrequencyRemoteService>(
      () => PostsFrequencyRemoteServiceImpl());
  sl.registerLazySingleton<QueriesDashRemoteService>(
      () => QueriesDashRemoteServiceImpl());
  sl.registerLazySingleton<SentimentBySourceRemoteService>(
      () => SentimentBySourceRemoteServiceImpl());
  sl.registerLazySingleton<TopInfluencerRemoteService>(
      () => TopInfluencerRemoteServiceImpl());

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External
  String domain = Constants.AUTH0_DOMAIN;
  String clientId = Constants.AUTH0_CLIENT_ID;
  final auth = Auth0(baseUrl: 'https://$domain/', clientId: clientId);
  sl.registerLazySingleton(() => auth);

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton<HttpManager>(() => HttpManagerImpl());
}
