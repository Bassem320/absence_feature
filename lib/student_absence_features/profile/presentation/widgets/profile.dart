import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/assets.dart';
import 'profile_item.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: ListView(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 16,),
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image.asset(
                    AppImages.appLogoPNG,
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
          ),
          ProfileItem(
            label: 'id_number'.tr(),
            subtitle: "31106291204873",
            icon: Icons.numbers,
          ),
          ProfileItem(
            label: 'nationality'.tr(),
            subtitle: "Egyptian",
            icon: Icons.flag,
          ),
          ProfileItem(
            label: 'phone'.tr(),
            subtitle: "0100100100",
            icon: Icons.phone,
          ),
          ProfileItem(
            label: 'academic_year'.tr(),
            subtitle: "فرقة الأولى - قسم اتصالات",
            icon: Icons.school,
          ),
        ],
      ),
    );
  }
}
