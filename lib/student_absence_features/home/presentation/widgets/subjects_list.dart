import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/table_day_entity.dart';
import '../logic/dropdown_cubit/dropdown_cubit.dart';
import 'subject_item.dart';

class SubjectsList extends StatelessWidget {
  const SubjectsList({
    super.key,
    required this.tableData,
  });

  final List<TableDayEntity>? tableData;


  //TODO Remove
  final _isCredit = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropdownCubit<int>, DropdownState<int>>(
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final dayTable = tableData?[state.value];
            return _isCredit == true
                ? SubjectItem(
              periodCH: dayTable?.periodsCH?[index],
              onSubjectPressed: () {},
            )
                : SubjectItem(
              periodAY: dayTable?.periodsAY?[index],
              onSubjectPressed: () {},
            );
          },
          itemCount: getItemCount(state.value),
        );
      },
    );
  }

  int getItemCount(int value) {
    final dayTable = tableData?[value];
    int itemCount = 0;
    if (dayTable != null) {
      if (_isCredit == true) {
        itemCount = dayTable.periodsCH?.length ?? 0;
      } else if (_isCredit == false) {
        itemCount = dayTable.periodsAY?.length ?? 0;
      } else {
        itemCount = 0;
      }
    }
    return itemCount;
  }
}
