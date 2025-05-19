import 'package:flutter/material.dart';

import '../../domain/entities/table_day_entity.dart';
import '../../domain/entities/credit_subject_entity.dart';
import 'schedule_day_filter.dart';
import 'subjects_list.dart';

class Schedule extends StatelessWidget {
  Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ScheduleDayFilter(
                tableData: data,
              ),
            ),
            Expanded(
              child: SubjectsList(
                tableData: data,
              ),
            )
          ],
        ),
      ),
    );
  }

  final data = [
    TableDayEntity(name: 'Saturday', id: '65.2.1.', periodsCH: [
      CreditTablePeriodEntity(
        text:
            "محاضرة ف111 - حرارة وخواص مادة&nbsp;<br/>hal2------ - مدرج 2-------اماكن مكررة - -----",
        period: "14:00-15:00",
        type: "1",
        staff: "",
        place: "hal2------ - مدرج 2-------اماكن مكررة",
        course: "حرارة وخواص مادة",
        courseCode: "ف111",
        studyType: "محاضرة",
      ),
      CreditTablePeriodEntity(
        text:
            "محاضرة ر131 - جبر وهندسة&nbsp;<br/>hal 6---- - مدرج 6-----اماكن مكررة - -----",
        period: "16:00-18:00",
        type: "1",
        staff: "",
        place: "hal 6---- - مدرج 6-----اماكن مكررة",
        course: "جبر وهندسة",
        courseCode: "ر131",
        studyType: "محاضرة",
      )
    ]),
    TableDayEntity(name: 'Sunday', id: '65.2.2.', periodsCH: []),
    TableDayEntity(name: 'Monday', id: '65.2.3.', periodsCH: []),
    TableDayEntity(name: 'Tuesday', id: '65.2.4.', periodsCH: []),
    TableDayEntity(name: 'Wednesday', id: '65.2.5.', periodsCH: []),
    TableDayEntity(name: 'Thursday', id: '65.2.6.', periodsCH: []),
    TableDayEntity(name: 'Friday', id: '65.2.7.', periodsCH: []),
  ];
}
