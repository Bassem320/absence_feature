import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_core/shared_core.dart';

import '../logic/cubit/qr_cubit/qr_cubit.dart';
import '../widgets/qr_scanner.dart';
import 'class_room_page.dart';

class TeacherScanner extends StatelessWidget {
  const TeacherScanner({super.key});

  static const name = 'teacher_scanner';
  static const routeName = '${TeacherClassRoomPage.routeName}/teacher_scanner';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TeacherQrCodeCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('teacher_scanner').tr(),
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
      ),
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

  Widget getPage() => QrScanner();
}
