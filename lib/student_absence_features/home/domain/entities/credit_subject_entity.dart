import 'package:json_annotation/json_annotation.dart';

import 'credit_staff_entity.dart';

@JsonSerializable()
class CreditTablePeriodEntity {
  CreditTablePeriodEntity({
    this.text,
    this.length,
    this.period,
    this.type,
    this.staff,
    this.place,
    this.courseCode,
    this.course,
    this.studyType,
    this.staffDetails,
  });

  @JsonKey(name: 'text')
  String? text;
  @JsonKey(name: 'length')
  String? length;
  @JsonKey(name: 'title')
  String? period;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'DrNames')
  String? staff;
  @JsonKey(name: 'DrsDetails')
  List<CreditStaffEntity>? staffDetails;
  @JsonKey(name: 'placeName')
  String? place;
  @JsonKey(name: 'crsCode')
  String? courseCode;
  @JsonKey(name: 'CrsName')
  String? course;
  @JsonKey(name: 'studyType')
  String? studyType;
}
