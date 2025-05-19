import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/absence/absence_cubit.dart';

class MethodData extends StatelessWidget {
  const MethodData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        return ListTile(
          title: Text(
            "absence_method",
          ).tr(),
          subtitle: Text(
            state.method.toString(),
          ).tr(),
        );
      },
    );
  }
}
