import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';

import '../../../home/presentation/pages/home_page.dart';
import 'student_info.dart';

class StudentQrInfoPage extends StatefulWidget {
  static const name = 'student_info';
  static const routeName = '${StudentHomePage.routeName}/student_info';



  const StudentQrInfoPage({super.key});

  @override
  State<StudentQrInfoPage> createState() => _StudentQrInfoPageState();
}

class _StudentQrInfoPageState extends State<StudentQrInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: di<MenuControllerDrawer>().scaffoldKey,
      appBar: AppBar(
        title: Text('student_info').tr(),
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

  Widget getPage() => StudentInfo();

}
