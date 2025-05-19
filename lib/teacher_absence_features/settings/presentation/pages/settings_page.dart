import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:shared_core/shared_core.dart';
import '../../../home/presentation/pages/home_page.dart';

class TeacherSettingsPage extends StatefulWidget {
  static const name = 'teacher_settings';
  static const routeName = '${TeacherHomePage.routeName}/teacher_settings';

  const TeacherSettingsPage({super.key});

  @override
  State<TeacherSettingsPage> createState() => _TeacherSettingsPageState();
}

class _TeacherSettingsPageState extends State<TeacherSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: di<MenuControllerDrawer>().scaffoldKey,
      appBar: AppBar(
        title: Text('settings').tr(),
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

  Widget getPage() => Column(
    children: [
      ListTile(
        leading: Icon(Icons.language),
        title: Text(
          "language".tr(),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        subtitle: DropdownButton<Locale>(
          value: context.locale,
          items: context.supportedLocales
              .map(
                (e) => DropdownMenuItem(
              value: e,
              child: Text(
                (e.languageCode == 'en') ? 'english' : 'arabic',
              ).tr(),
            ),
          )
              .toList(),
          onChanged: (locale) =>
              context.setLocale(locale!),
        ),
      ),
    ],
  );
}
