import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/table_day_entity.dart';
import '../logic/dropdown_cubit/dropdown_cubit.dart';

class ScheduleDayFilter extends StatelessWidget {
  const ScheduleDayFilter({super.key, required this.tableData});

  final List<TableDayEntity>? tableData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Theme.of(context)
              .colorScheme
              .secondaryContainer,
          width: 2,
        ),
      ),
      child: BlocBuilder<DropdownCubit<int>, DropdownState<int>>(
        builder: (context, state) {
          return DropdownButtonFormField<int>(
            dropdownColor: Theme.of(context).colorScheme.onPrimary,
            value: state.value,
            items: [
              for (final (index, day) in getWeekDays(context).indexed)
                DropdownMenuItem<int>(
                  value: index,
                  child: Text(
                    day,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
            ],
            onChanged: (value) {
              if (value != null) {
                context.read<DropdownCubit<int>>().changeValue(value);
              }
            },
            style: Theme.of(context).textTheme.bodySmall?.apply(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                ),
          );
        },
      ),
    );
  }

  List<String> getWeekDays(context) {
    return [
      for (final day in tableData!) day.name!,
    ];
  }
}
