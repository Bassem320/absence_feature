import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../widgets/profile.dart';

class StudentProfilePage extends StatefulWidget {
  static const name = 'student_profile';
  static const routeName = '${StudentHomePage.routeName}/student_profile';

  const StudentProfilePage({super.key});

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: di<MenuControllerDrawer>().scaffoldKey,
      appBar: AppBar(
        title: Text('profile').tr(),
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

  Widget getPage() => Profile();

}
