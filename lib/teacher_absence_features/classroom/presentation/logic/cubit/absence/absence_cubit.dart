import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_core/shared_core.dart';

part 'absence_state.dart';

class AbsenceCubit extends Cubit<AbsenceState> {
  AbsenceCubit() : super(const AbsenceDataChanged());

  onAbsenceMethodChanged(AbsenceMethod? method) {
    emit(state.copyWith(method: method));
  }

  onUniversityChanged(String university) => emit(
        state.copyWith(
          university: university,
          faculty: '',
          department: '',
          group: '',
          academicYear: '',
          subject: '',
        ),
      );

  onFacultyChanged(String faculty) => emit(
        state.copyWith(
          faculty: faculty,
          department: '',
          group: '',
          academicYear: '',
          subject: '',
        ),
      );

  onDepartmentChanged(String department) => emit(
        state.copyWith(
          department: department,
          group: '',
          academicYear: '',
          subject: '',
        ),
      );

  onAcademicYearChanged(String academicYear) => emit(
    state.copyWith(
      academicYear: academicYear,
      group: '',
      subject: '',
    ),
  );


  onGroupChanged(String group) => emit(
        state.copyWith(
          group: group,
          subject: '',
        ),
      );



  onSubjectChanged(String subject) => emit(
        state.copyWith(
          subject: subject,
        ),
      );
}
