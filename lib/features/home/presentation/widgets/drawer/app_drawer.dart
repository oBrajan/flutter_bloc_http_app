import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy2know_flutter/features/auth/presentation/manager/auth_bloc/auth.dart';
import 'package:easy2know_flutter/features/home/presentation/widgets/drawer/drawer_project_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return Drawer(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text('Milos Rajic'), // todo User Name
                    accountEmail: Text(state.email),
                    currentAccountPicture: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://greendestinations.org/wp-content/uploads/2019/05/avatar-exemple.jpg',
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          value: downloadProgress.progress,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  ListTile(
//                    key: Key('k'),
                    leading: Icon(Icons.list),
                    title: Text('Projects'),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
//                  Divider(),
                  ListTile(
//                    key: Key('r'),
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () {
//                      Navigator.of(context).pop();

                      _logOut(context);
                    },
                  ),
                  Divider(),
                  ProjectsStats(),
                ],
              ),
            ),
          );
        }
        return Center();
      },
    );
  }
}

Future<bool> _logOut(BuildContext context) {
  return showDialog(
        context: context,
        child: AlertDialog(
          title: Text('Do you want to Log out?'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LoggedOut());

                Navigator.of(context).pop();
              },
              child: Text('Log out'),
            ),
          ],
        ),
      ) ??
      false;
}
