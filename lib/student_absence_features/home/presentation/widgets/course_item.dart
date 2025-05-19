import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/course_data.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key, required this.course});

  final CourseData course;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(
          color: ((course.absentTimes! / course.expectedTotalTimes!) < 0.25)
              ? Theme.of(context).colorScheme.shadow
              : Theme.of(context).colorScheme.onErrorContainer,
          width: 2.0,
        ),
      ),
      child: ListTile(
        title: Text(
          course.name!,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
        ),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "present_number".tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                TextSpan(
                  text: ' ${course.presentTimes}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                ),
              ]),
            ),
            SizedBox(
              width: 36,
            ),
            Icon(
              Icons.cancel,
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: "absence_number".tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                TextSpan(
                  text: ' ${course.absentTimes}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
