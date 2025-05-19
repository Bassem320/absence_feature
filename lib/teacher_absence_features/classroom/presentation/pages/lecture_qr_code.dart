import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';

import '../widgets/lecture_info.dart';
import 'class_room_page.dart';

class LectureQrCode extends StatelessWidget {
  const LectureQrCode({super.key});

  static const name = 'lecture_qr';
  static const routeName = '${TeacherClassRoomPage.routeName}/lecture_qr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lecture_qr').tr(),
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

  Widget getPage() => LectureInfo(
    lectureData: {
      "university": "Banha University",
      "faculty": "Faculty of Engineering",
      "department": "Computer Systems and Control",
      "group": "Group 2",
      "timeStamp": DateTime.now().toString(),
    },
  );
}
