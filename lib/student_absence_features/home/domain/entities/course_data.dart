class CourseData {
  final String? name;
  final String? code;
  final int? presentTimes;
  final int? absentTimes;
  final int? totalTimes;
  final int? expectedTotalTimes;

  String? get nameShort => name?.substring(0,4);

  CourseData({
    this.name,
    this.code,
    this.presentTimes,
    this.absentTimes,
    this.totalTimes,
    this.expectedTotalTimes,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
    name: json['name'],
    code: json['code'],
    presentTimes: json['present'],
    absentTimes: json['absence'],
    totalTimes: json['total'],
    expectedTotalTimes: json['expected_total'],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "code": code,
    "present": presentTimes,
    "absence": absentTimes,
    "total": totalTimes,
    "expected_total": expectedTotalTimes,
  };
}

const absenceData = [
  {
    "name": "Mathematics 3",
    "code": "ECE121",
    "present": 5,
    "absence": 2,
    "total": 7,
    "expected_total": 14,
  },
  {
    "name": "Communication",
    "code": "ECE122",
    "present": 3,
    "absence": 4,
    "total": 7,
    "expected_total": 14,
  },
  {
    "name": "Physics",
    "code": "ECE123",
    "present": 7,
    "absence": 0,
    "total": 7,
    "expected_total": 14,
  },
  {
    "name": "Computer Science",
    "code": "ECE124",
    "present": 6,
    "absence": 1,
    "total": 7,
    "expected_total": 14,
  },
  {
    "name": "Mechanics",
    "code": "ECE125",
    "present": 0,
    "absence": 7,
    "total": 7,
    "expected_total": 14,
  },
  {
    "name": "English",
    "code": "ECE126",
    "present": 5,
    "absence": 2,
    "total": 7,
    "expected_total": 14,
  },
];
