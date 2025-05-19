part of 'absence_cubit.dart';

@immutable
sealed class AbsenceState {
  final String? university;
  final String? faculty;
  final String? department;
  final String? academicYear;
  final String? group;
  final String? subject;
  final AbsenceMethod? method;

  bool get stepOneDone => method!= null;
  bool get stepTwoDone => department.checkData();
  bool get stepThreeDone => subject.checkData();

  const AbsenceState({
    this.university,
    this.faculty,
    this.department,
    this.academicYear,
    this.group,
    this.subject,
    this.method,
  });

  AbsenceState copyWith({
    String? university,
    String? faculty,
    String? department,
    String? academicYear,
    String? group,
    String? subject,
    AbsenceMethod? method,
  });

  Map<String, dynamic> toJson() => {
    "university": university,
    "faculty": faculty,
    "department": department,
    "year": academicYear,
    "group": group,
    "subject": subject,
    "method": method.toString(),
  };
}

final class AbsenceDataChanged extends AbsenceState {
  const AbsenceDataChanged({
    super.university,
    super.faculty,
    super.department,
    super.academicYear,
    super.group,
    super.subject,
    super.method,
  });

  @override
  AbsenceState copyWith({
    String? university,
    String? faculty,
    String? department,
    String? academicYear,
    String? group,
    String? subject,
    AbsenceMethod? method,
  }) =>
      AbsenceDataChanged(
        university: university ?? this.university,
        faculty: faculty ?? this.faculty,
        department: department ?? this.department,
        academicYear: academicYear ?? this.academicYear,
        group: group ?? this.group,
        subject: subject ?? this.subject,
        method: method ?? this.method,
      );
}

enum AbsenceMethod {
  generateQrCode,
  scanStudentsQrCode,
  manualAbsence;

  @override
  String toString() {
    switch (this) {
      case generateQrCode:
        return "generate_qr_code";
      case scanStudentsQrCode:
        return "scan_students_qr";
      case manualAbsence:
        return "manual_absence";
    }
  }
}
