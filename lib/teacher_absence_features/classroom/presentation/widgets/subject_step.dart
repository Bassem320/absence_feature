import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_core/shared_core.dart';

import '../logic/cubit/absence/absence_cubit.dart';
import 'dropdown_element.dart';

class SubjectStep extends StatelessWidget {
  const SubjectStep({
    super.key,
    required this.groups,
    required this.academicYears,
    required this.subjects,
    required this.formKey,
  });

  final List<String> groups;
  final List<String> academicYears;
  final List<String> subjects;
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
                  name: 'academic_year',
                  value:
                      state.academicYear.checkData() ? state.academicYear : null,
                  items: academicYears,
                  hint: "select_academic_year".tr(),
                  validator: Validations.isValidField,
                  onChanged: (input) {
                    formKey.currentState?.patchValue({
                      "group": "",
                      "subject": "",
                    });
                    context.read<AbsenceCubit>().onAcademicYearChanged(input);
                  },
                ),
                if (state.academicYear.checkData())
                  DropdownElement<String>(
                    name: 'group',
                    value: state.group.checkData() ? state.group: null,
                    items: groups,
                    hint: "select_group".tr(),
                    validator: Validations.isValidField,
                    onChanged: (input) {
                      formKey.currentState?.patchValue({
                        "subject": "",
                      });
                      context.read<AbsenceCubit>().onGroupChanged(input);
                    },
                  ),
                if (state.group.checkData())
                  DropdownElement<String>(
                    name: 'subject',
                    value: state.subject.checkData() ? state.subject: null,
                    items: subjects,
                    hint: "select_subject".tr(),
                    validator: Validations.isValidField,
                    onChanged: context.read<AbsenceCubit>().onSubjectChanged,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
