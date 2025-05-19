import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../student_absence_features/profile/presentation/widgets/profile_group.dart';
import 'profile_item.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({super.key, required this.appLogoPNG});

  final String appLogoPNG;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 16,
            ),
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image.asset(
                    appLogoPNG,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Ahmed El-Gamal",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
          ),
          ProfileItem(
            label: 'name'.tr(),
            subtitle: "Ahmed Mohamed Hassan El-Gamal",
            icon: Icons.person,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          SizedBox(height: 8,),
          ProfileGroup(
            title: 'academic_data'.tr(),
            icon: Icon(Icons.school),
            children: [
              ProfileItem(
                label: 'university'.tr(),
                subtitle: "Mansoura University",
                color: Colors.transparent,
              ),
              ProfileItem(
                label: 'faculty'.tr(),
                subtitle: "Faculty of Engineering",
                color: Colors.transparent,
              ),
              ProfileItem(
                label: 'department'.tr(),
                subtitle: "Electronics and Communications",
                color: Colors.transparent,
              ),
              ProfileItem(
                label: 'position'.tr(),
                subtitle: "Associate Professor",
                color: Colors.transparent,
              ),
            ],
          ),
          const SizedBox(height: 8,),
          ProfileGroup(
              title: 'personal_data'.tr(),
              icon: Icon(Icons.person),
              children: [
                ProfileItem(
                  label: 'national_id'.tr(),
                  subtitle: "31106291204873",
                  color: Colors.transparent,
                ),
                ProfileItem(
                  label: 'nationality'.tr(),
                  subtitle: "Egyptian",
                  color: Colors.transparent,
                ),
                ProfileItem(
                  label: 'phone'.tr(),
                  subtitle: "0100100100",
                  color: Colors.transparent,
                ),
              ]),

        ],
      ),
    );
  }
}
