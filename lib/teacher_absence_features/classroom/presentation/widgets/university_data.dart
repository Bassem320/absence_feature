import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/cubit/absence/absence_cubit.dart';

class UniversityData extends StatelessWidget {
  const UniversityData({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AbsenceCubit, AbsenceState>(
      builder: (context, state) {
        return Column(
          children: [
            ListTile(
              title: Text(
                "university",
              ).tr(),
              subtitle: Text(
                state.university!,
              ),
            ),
            ListTile(
              title: Text(
                "faculty",
              ).tr(),
              subtitle: Text(
                state.faculty!,
              ),
            ),
            ListTile(
              title: Text(
                "department",
              ).tr(),
              subtitle: Text(
                state.department!,
              ),
            ),
          ],
        );
      },
    );
  }
}
