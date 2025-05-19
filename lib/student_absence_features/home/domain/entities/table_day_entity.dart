import 'package:json_annotation/json_annotation.dart';

import 'academic_subject_entity.dart';
import 'credit_subject_entity.dart';

@JsonSerializable()
class TableDayEntity {
  TableDayEntity({
    this.name,
    this.periodsAY,
    this.id,
    this.periodsCH,
  });

  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'periods')
  List<AcademicYearPeriodEntity?>? periodsAY;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'events')
  List<CreditTablePeriodEntity?>? periodsCH;
}
