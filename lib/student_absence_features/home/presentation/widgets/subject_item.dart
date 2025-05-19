import 'package:flutter/material.dart';
import 'package:shared_core/shared_core.dart';


import '../../domain/entities/academic_subject_entity.dart';
import '../../domain/entities/credit_subject_entity.dart';

class SubjectItem extends StatelessWidget {
  final CreditTablePeriodEntity? periodCH;
  final AcademicYearPeriodEntity? periodAY;
  final void Function() onSubjectPressed;

  const SubjectItem({
    super.key,
    this.periodCH,
    this.periodAY,
    required this.onSubjectPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.shadow,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      color: Theme.of(context).colorScheme.onPrimaryContainer,
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: onSubjectPressed,
          title: Text(
            (periodCH != null ? periodCH?.course : periodAY?.course) ?? '',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Responsive.isMobileDevice(context)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getSubjectDataList(context),
                  )
                : Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: getSubjectDataList(context),
                  ),
          ),
        ),
      ),
    );
  }

  String oneInstructorOrMore(List staff) {
    if (staff.length > 1) {
      return '...';
    } else {
      return '';
    }
  }

  List<Widget> getSubjectDataList(context) => [
        if ((periodAY != null && periodAY!.staff.checkData()) ||
            (periodCH != null && periodCH!.staffDetails.checkData()))
          Wrap(
            children: [
              const Icon(Icons.person),
              const SizedBox(
                width: 8,
              ),
              Text(
                (periodAY != null)
                    ? '${periodAY!.staff![0]} ${oneInstructorOrMore(periodAY!.staff!)}'
                    : '${periodCH!.staffDetails![0]} ${oneInstructorOrMore(periodCH!.staffDetails!)}',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        if ((periodAY != null && periodAY!.period.checkData()) ||
            (periodCH != null && periodCH!.period.checkData()))
          Wrap(
            children: [
              const Icon(Icons.access_time),
              const SizedBox(
                width: 8,
              ),
              Text(
                (periodCH != null ? periodCH?.period : periodAY?.period) ?? '',
                // DateFormat.Hm().format(currentSubject.subjectTime),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        if ((periodAY != null && periodAY!.place.checkData()) ||
            (periodCH != null && periodCH!.place.checkData()))
          Wrap(
            children: [
              const Icon(Icons.location_on_outlined),
              const SizedBox(
                width: 8,
              ),
              Text(
                (periodCH != null ? periodCH?.place : periodAY?.place) ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
        const SizedBox(
          width: 20,
        ),
      ];
}
