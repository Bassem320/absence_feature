import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_core/shared_core.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../logic/cubit/qr_cubit/qr_cubit.dart';
import '../widgets/qr_scanner.dart';

class ClassRoomRegistrationPage extends StatefulWidget {
  static const name = 'classroom';
  static const routeName = '${StudentHomePage.routeName}/classroom';

  final qrCubit = QrCodeCubit();

  ClassRoomRegistrationPage({super.key});

  @override
  State<ClassRoomRegistrationPage> createState() =>
      _ClassRoomRegistrationPageState();
}

class _ClassRoomRegistrationPageState extends State<ClassRoomRegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.qrCubit,
      child: Scaffold(
        // key: di<MenuControllerDrawer>().scaffoldKey,
        appBar: AppBar(title: Text('classroom_absence').tr()),
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surface,
        body: SafeArea(
          child: Responsive(
            mobile: _mobile(),
            tablet: _tablet(),
            desktop: _desktop(),
          ),
        ),
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
