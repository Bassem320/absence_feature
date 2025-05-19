import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/course_data.dart';
import 'absence_histogram.dart';
import 'course_item.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final List<CourseData> courses = List.from(
    absenceData.map(
      (item) => CourseData.fromJson(item),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
      body: Container(
        margin: EdgeInsets.all(8),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'dashboard'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            AbsenceHistogram(
              courses: courses,
            ),
            Divider(),
            for (final course in courses)
              CourseItem(
                course: course,
              ),
          ],
        ),
      ),
    );
  }
}
