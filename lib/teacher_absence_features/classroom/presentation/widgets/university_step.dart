import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_core/shared_core.dart';

import '../logic/cubit/absence/absence_cubit.dart';
import 'dropdown_element.dart';

class UniversityStep extends StatelessWidget {
  const UniversityStep({
    super.key,
    required this.universities,
    required this.faculties,
    required this.departments,
    required this.formKey,
  });

  final List<String> universities;
  final List<String> faculties;
  final List<String> departments;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: FormBuilder(
            key: formKey,
            child: Column(
              children: [
                DropdownElement<String>(
                  name: 'university',
                  value: state.university.checkData() ? state.university : null,
                  items: universities,
                  hint: "select_university".tr(),
                  validator: Validations.isValidField,
                  onChanged: (input) {
                    formKey.currentState?.patchValue({
                      'faculty': '',
                      'department': '',
                    });
                    context.read<AbsenceCubit>().onUniversityChanged(input);

                  },
                ),
                if (state.university.checkData())
                  DropdownElement<String>(
                    name: 'faculty',
                    value: state.faculty.checkData() ? state.faculty : null,
                    items: faculties,
                    hint: "select_faculty".tr(),
                    validator: Validations.isValidField,
                    onChanged: (input) {
                      formKey.currentState?.patchValue({
                        'department': '',
                      });
                      context.read<AbsenceCubit>().onFacultyChanged(input);
                    },
                  ),
                if (state.faculty.checkData())
                  DropdownElement<String>(
                    name: 'department',
                    value:
                        state.department.checkData() ? state.department : null,
                    items: departments,
                    hint: "select_department".tr(),
                    validator: Validations.isValidField,
                    onChanged: context.read<AbsenceCubit>().onDepartmentChanged,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
