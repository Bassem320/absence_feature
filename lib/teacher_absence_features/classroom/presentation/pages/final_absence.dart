import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';

import 'class_room_page.dart';

class FinalAbsence extends StatelessWidget {
  const FinalAbsence({super.key});

  static const name = 'final_absence';
  static const routeName = '${TeacherClassRoomPage.routeName}/final_absence';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('final_absence').tr(),
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
