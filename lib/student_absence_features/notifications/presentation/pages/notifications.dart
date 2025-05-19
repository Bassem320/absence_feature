import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';

import '../../../home/presentation/pages/home_page.dart';

class StudentNotificationsPage extends StatefulWidget {
  static const name = 'notifications';
  static const routeName = '${StudentHomePage.routeName}/notifications';

  const StudentNotificationsPage({super.key});

  @override
  State<StudentNotificationsPage> createState() => _StudentNotificationsPageState();
}

class _StudentNotificationsPageState extends State<StudentNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: di<MenuControllerDrawer>().scaffoldKey,
      appBar: AppBar(
        title: Text('notifications').tr(),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Responsive(
        mobile: _mobile(),
        tablet: _tablet(),
        desktop: _desktop(),
      )),
    );
  }

  Widget _mobile() {
    return getPage();
  }

  Widget _tablet() {
    return getPage();
  }

  Widget _desktop() {
    return getPage();
  }

  Widget getPage() => Container();

}
