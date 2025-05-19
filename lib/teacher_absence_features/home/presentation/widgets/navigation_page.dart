import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/top_navigation_cubit/top_navigation_cubit.dart';
import '../../domain/entities/navgation_page_data.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key, required this.pages});

  final List<NavigationPageData> pages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocBuilder<TopNavigationCubit, TopNavigationState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.screenIndex,
            children: pages
                .map(
                  (e) => e.page,
                ).toList(),
          );
        },
      ),
    );
  }
}
