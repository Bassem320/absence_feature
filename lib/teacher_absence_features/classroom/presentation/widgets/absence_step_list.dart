import 'package:easy_localization/easy_localization.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';

import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';

import '../../domain/entities/stepper_step.dart';
import '../logic/cubit/absence/absence_cubit.dart';
import '../logic/cubit/stepper_cubit/stepper_cubit.dart';
import '../pages/lecture_qr_code.dart';
import '../pages/manual_absence.dart';
import '../pages/teacher_scanner.dart';
import 'method_data.dart';
import 'method_step.dart';
import 'subject_step.dart';
import 'university_data.dart';
import 'university_step.dart';

class AbsenceStepList extends StatelessWidget {
  AbsenceStepList({
    super.key,
  });

  final List<GlobalKey<FormBuilderState>> _formKeys = [
    GlobalKey<FormBuilderState>(),
    GlobalKey<FormBuilderState>(),
    GlobalKey<FormBuilderState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepperCubit, StepperState>(
      builder: (context, state) {
        return ListView(
          children: [
            EasyStepper(
              activeStep: state.stepIndex,
              stepShape: StepShape.rRectangle,
              activeStepTextColor: Theme.of(context).colorScheme.tertiary,
              finishedStepTextColor: Theme.of(context).colorScheme.primary,
              internalPadding: 0,
              showLoadingAnimation: false,
              stepRadius: 13,
              showStepBorder: false,
              stepBorderRadius: 16,
              lineStyle: LineStyle(
                lineType: LineType.normal,
                lineThickness: 3,
                lineLength: 80,
                activeLineColor: Theme.of(context).colorScheme.shadow,
                defaultLineColor: Theme.of(context).colorScheme.primary,
                unreachedLineColor: Theme.of(context).colorScheme.shadow,
              ),
              borderThickness: 2,
              steppingEnabled: false,
              padding: const EdgeInsets.all(10),
              finishedStepBorderColor: Theme.of(context).colorScheme.primary,
              finishedStepBackgroundColor:
                  Theme.of(context).colorScheme.primary,
              activeStepIconColor: Theme.of(context).colorScheme.tertiary,
              steps: [
                for (final step in steps)
                  EasyStep(
                      customStep: CircleAvatar(
                        radius: 13,
                        backgroundColor: Theme.of(context).colorScheme.shadow,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: state.stepIndex > step.index
                              ? Theme.of(context).colorScheme.primary
                              : state.stepIndex == step.index
                                  ? Theme.of(context).colorScheme.tertiary
                                  : Theme.of(context).colorScheme.shadow,
                        ),
                      ),
                      title: step.title.tr(),
                      // customTitle: Text(
                      //   step.title,
                      //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      //     color:
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ).tr(),
                  ),
              ],
              onStepReached: context.read<StepperCubit>().selectStep,
            ),
            if (state.stepIndex > 0) MethodData(),
            if (state.stepIndex > 1) UniversityData(),
            LazyLoadIndexedStack(
              index: state.stepIndex,
              children: [
                MethodStep(formKey: _formKeys[0]),
                UniversityStep(
                  formKey: _formKeys[1],
                  universities: [
                    "Mansoura University",
                    "Banha University",
                    "Cairo University",
                    "New Mansoura University",
                  ],
                  faculties: [
                    "Faculty of Engineering",
                    "Faculty of Medicine",
                    "Faculty of Commerce",
                    "Faculty of Computer Science",
                  ],
                  departments: [
                    "Electronics and Communications",
                    "Electrical Engineering",
                    "Computer Systems and Control",
                  ],
                ),
                SubjectStep(
                  formKey: _formKeys[2],
                  academicYears: [
                    "first year",
                    "second year",
                    "third year",
                    "fourth year",
                  ],
                  groups: [
                    "Group 1",
                    "Group 2",
                    "Group 3",
                    "Group 4",
                  ],
                  subjects: [
                    "Electronics 1",
                    "Communications",
                    "Programming",
                  ],
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (state.stepIndex > 0)
                    ElevatedButton(
                      onPressed: () => context
                          .read<StepperCubit>()
                          .selectStep(state.stepIndex - 1),
                      child: Text("previous").tr(),
                    )
                  else
                    Container(),
                  if (state.stepIndex < 2)
                    ElevatedButton(
                      onPressed: () {
                        if (_formKeys[state.stepIndex]
                                .currentState
                                ?.saveAndValidate() ??
                            false) {
                          context
                              .read<StepperCubit>()
                              .selectStep(state.stepIndex + 1);
                        }
                      },
                      child: Text("next").tr(),
                    ),
                  if (state.stepIndex == 2)
                    ElevatedButton(
                      onPressed: () {
                        if (_formKeys[state.stepIndex].currentState!.validate()) {
                          final absenceState = context.read<AbsenceCubit>().state;
                          switch (absenceState.method!) {
                            case AbsenceMethod.generateQrCode:
                              context.pushNamed(LectureQrCode.name);
                              break;
                            case AbsenceMethod.scanStudentsQrCode:
                              context.pushNamed(TeacherScanner.name);
                              break;
                            case AbsenceMethod.manualAbsence:
                              context.pushNamed(ManualAbsence.name);
                              break;
                          }
                        }
                      },
                      child: Text("apply").tr(),
                    ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
