import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.label,
    this.subtitle,
    this.icon,
    this.onItemPressed,
    this.trailing,
  });

  final IconData? icon;
  final String label;
  final String? subtitle;
  final void Function()? onItemPressed;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).colorScheme.shadow, width: 2.h),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: ListTile(
        leading: (icon != null)?Icon(
          icon,
          color: Theme.of(context).colorScheme.inverseSurface,
        ): null,
        title: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color:Theme.of(context).colorScheme.inversePrimary,
              ),
        ),
        subtitle: (subtitle != null) ? Text(
          subtitle!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ): null,
        onTap: onItemPressed,
        trailing: trailing,
      ),
    );
  }
}
