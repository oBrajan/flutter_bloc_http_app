import 'package:flutter/material.dart';

class DashboardDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text('Back to Projects'),
              onTap: () {
                Navigator.of(context).pop(); // Close drawer
                Navigator.of(context).pop(); // Close Dashboard page
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.local_post_office),
              title: Text('Posts'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
