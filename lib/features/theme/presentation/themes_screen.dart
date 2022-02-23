import 'package:easy2know_flutter/features/theme/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_themes.dart';

class ThemesScreen extends StatelessWidget {
  static const String namedRout = '/themesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Theme'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          return Card(
            color: appThemeData[itemAppTheme].primaryColor,
            child: ListTile(
              title: Text(
                itemAppTheme.toString(),
                style: appThemeData[itemAppTheme].textTheme.body1,
              ),
              onTap: () {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeChanged(theme: itemAppTheme),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
