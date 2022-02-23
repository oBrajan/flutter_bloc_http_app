import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics.dart';

import 'di/injection_container.dart' as di;
import 'package:easy2know_flutter/features/auth/presentation/manager/auth_bloc/auth.dart';
import 'package:easy2know_flutter/features/theme/bloc/theme.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'core/routes/router.dart';
import 'package:easy2know_flutter/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/home/presentation/manager/projects_bloc/projects.dart';
import 'features/home/presentation/manager/queries_bloc/queries.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  await di.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthBloc>()..add(AppStarted())),
        BlocProvider(create: (_) => di.sl<ThemeBloc>()),
        BlocProvider(
          create: (_) => di.sl<ProjectsBloc>()..add(GetProjectsList()),
        ),
        BlocProvider(create: (_) => di.sl<TopicsBloc>()),
        BlocProvider(create: (_) => di.sl<QueriesBloc>()),
      ],
      child: E2KApp(),
    ),
  );
}

class E2KApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        theme: state.themeData,
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Unauthenticated) {
              return LoginPage();
            }
            if (state is Authenticated) {
              return ProjectsPage();
            }
            return SplashScreen();
          },
        ),
        onGenerateRoute: Router.generateRoute,
      );
    });
  }
}
