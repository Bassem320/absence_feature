import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../domain/entities/course_data.dart';

class AbsenceHistogram extends StatelessWidget {
  const AbsenceHistogram({super.key, required this.courses});

  final List<CourseData> courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          border: Border.all(
            color: Theme.of(context).colorScheme.shadow,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          title: ChartTitle(text: 'Student Absence Histogram'),
          legend: Legend(isVisible: true, position: LegendPosition.top),
          series: <ColumnSeries<CourseData, String>>[
            ColumnSeries<CourseData, String>(
              name: "Total",
                color: Theme.of(context).colorScheme.primaryContainer,
                dataSource: courses,
                xValueMapper: (CourseData course, _) => course.nameShort,
                yValueMapper: (CourseData course, _) => course.totalTimes,
                ),
            ColumnSeries<CourseData, String>(
                name: "Present",
                color: Theme.of(context).colorScheme.tertiary,
                dataSource: courses,
                xValueMapper: (CourseData course, _) => course.nameShort,
                yValueMapper: (CourseData course, _) => course.presentTimes,
                ),
            ColumnSeries<CourseData, String>(
                name: "Absence",
                color: Theme.of(context).colorScheme.onErrorContainer,
                dataSource: courses,
                xValueMapper: (CourseData course, _) => course.nameShort,
                yValueMapper: (CourseData course, _) => course.absentTimes,
                ),
          ],
        ));
  }
}
