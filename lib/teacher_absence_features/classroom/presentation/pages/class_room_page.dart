import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../widgets/absence_step_list.dart';

class TeacherClassRoomPage extends StatefulWidget {
  static const name = 'teacher_classroom';
  static const routeName = '${TeacherHomePage.routeName}/teacher_classroom';


  const TeacherClassRoomPage({super.key});

  @override
  State<TeacherClassRoomPage> createState() => _TeacherClassRoomPageState();
}

class _TeacherClassRoomPageState extends State<TeacherClassRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: di<MenuControllerDrawer>().scaffoldKey,
      appBar: AppBar(
        title: Text('classroom_absence').tr(),
      ),
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
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

  Widget getPage() => AbsenceStepList();

}
