import 'package:easy2know_flutter/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:easy2know_flutter/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/injection_container.dart';

class LoginPage extends StatelessWidget {
  static const namedRout = "/loginPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi there!'),
      ),
      body: BlocProvider<LoginBloc>(
        create: (_) => sl<LoginBloc>(),
        child: LoginForm(),
      ),
    );
  }
}
