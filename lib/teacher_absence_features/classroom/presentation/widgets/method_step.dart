import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:shared_core/shared_core.dart';

import '../logic/cubit/absence/absence_cubit.dart';

class MethodStep extends StatelessWidget {
  const MethodStep({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        return FormBuilder(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FormBuilderRadioGroup(
                  name: 'absence_method'.tr(),
                  initialValue: state.method,
                  decoration: InputDecoration(
                    labelText: 'absence_method'.tr(),
                  ),
                  validator: Validations.isValidData,
                  onChanged: context.read<AbsenceCubit>().onAbsenceMethodChanged,
                  options: [
                    for (final method in AbsenceMethod.values)
                      FormBuilderFieldOption(
                        value: method,
                        child: Text(method.toString().tr()),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
