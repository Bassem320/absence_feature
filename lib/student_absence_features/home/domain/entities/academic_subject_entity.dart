import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AcademicYearPeriodEntity {
  AcademicYearPeriodEntity({
    this.course,
    this.type,
    this.place,
    this.period,
    this.staff,
  });

  @JsonKey(name: 'course')
  String? course;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'place')
  String? place;
  @JsonKey(name: 'period')
  String? period;
  @JsonKey(name: 'staff')
  List<String>? staff;

}
