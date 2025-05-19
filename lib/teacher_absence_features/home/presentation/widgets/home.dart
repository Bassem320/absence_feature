import 'package:flutter/material.dart';

import '../../../../core/assets.dart';
import '../../../classroom/presentation/pages/class_room_page.dart';
import '../../../profile/presentation/pages/profile_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
import '../../domain/entities/menu_data.dart';
import 'menu_grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MenuGridView(
          dataList: [
            MenuItemData(title: 'classroom_absence', svg: AppIcons.classroomSVG, route: TeacherClassRoomPage.name),
            MenuItemData(title: 'student_absence', svg: AppIcons.classroomSVG, route: TeacherClassRoomPage.name),
            MenuItemData(title: 'profile', svg: AppIcons.profileSVG, route: TeacherProfilePage.name, iconWidth: 40),
            MenuItemData(title: 'settings', svg: AppIcons.settingsSVG, route: TeacherSettingsPage.name, iconWidth: 40),
          ],
        ),
      ),
    );
  }
}
