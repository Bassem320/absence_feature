import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_core/shared_core.dart';

import '../../../../core/assets.dart';
import '../../../../core/top_navigation_cubit/top_navigation_cubit.dart';
import '../../../../student_absence_features/home/presentation/logic/dropdown_cubit/dropdown_cubit.dart';
import '../../domain/entities/navgation_page_data.dart';
import '../widgets/dashboard.dart';
import '../widgets/home.dart';
import '../widgets/navigation_page.dart';
import '../widgets/schedule.dart';
import '../widgets/top_navigator_drawer.dart';

class TeacherHomePage extends StatefulWidget {
  static const name = 'teacher_home_page';
  static const routeName = '/teacher_home_page';

  TeacherHomePage({super.key});

  final navigationCubit = TopNavigationCubit();
  final dropdownCubit = DropdownCubit(0);

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider.value(
  value: widget.navigationCubit,
),
    BlocProvider.value(
      value: widget.dropdownCubit,
    ),
  ],
  child: Scaffold(
      // key: di<MenuControllerDrawer>().scaffoldKey,
      appBar: AppBar(
        title: Text('home').tr(),
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.tertiary,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              style: IconButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.surface,
              ),
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: TopNavigatorDrawer(
            pages: pages,
            onPressed: context.read<TopNavigationCubit>().selectScreen,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
          child: Responsive(
        mobile: _mobile(),
        tablet: _tablet(),
        desktop: _desktop(),
      )),
    ),
);
  }

  Widget _mobile() {
    return getPage();
  }

  Widget _tablet() {
    return getPage();
  }

  Widget _desktop() {
    return getPage();
  }

  Widget getPage() => NavigationPage(
        pages: pages,
      );

  List<NavigationPageData> get pages => [
        NavigationPageData(
          page: Home(),
          title: "home".tr(),
          svg: AppIcons.homeSVG,
        ),
        NavigationPageData(
          page: Dashboard(),
          title: 'dashboard'.tr(),
          svg: AppIcons.dashboardSVG,
        ),
        NavigationPageData(
          page: Schedule(),
          title: 'schedule'.tr(),
          svg: AppIcons.scheduleSVG,
        ),
      ];
}
