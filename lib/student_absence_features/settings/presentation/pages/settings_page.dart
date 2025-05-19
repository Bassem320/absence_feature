import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';

import '../../../home/presentation/pages/home_page.dart';

class StudentSettingsPage extends StatefulWidget {
  static const name = 'settings';
  static const routeName = '${StudentHomePage.routeName}/settings';

  const StudentSettingsPage({super.key});

  @override
  State<StudentSettingsPage> createState() => _StudentSettingsPageState();
}

class _StudentSettingsPageState extends State<StudentSettingsPage> {
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
              items: locales
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

  final locales = [
    Locale('en'),
    Locale('ar'),
  ];
}
