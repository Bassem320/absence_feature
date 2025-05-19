import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';

import '../../../home/presentation/pages/home_page.dart';

class TeacherNotificationsPage extends StatefulWidget {
  static const name = 'teacher_notifications';
  static const routeName = '${TeacherHomePage.routeName}/teacher_notifications';

  const TeacherNotificationsPage({super.key});

  @override
  State<TeacherNotificationsPage> createState() => _TeacherNotificationsPageState();
}

class _TeacherNotificationsPageState extends State<TeacherNotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
