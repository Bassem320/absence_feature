import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/menu_data.dart';
import 'menu_grid_item.dart';


class MenuGridView extends StatelessWidget {
  final List<MenuItemData> dataList;
  final bool isNested;


  const MenuGridView({
    super.key,
    required this.dataList,
    this.isNested = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: isNested,
      physics: isNested?NeverScrollableScrollPhysics():null, //
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: dataList.length,
      itemBuilder: (context, index) => MenuGridItem(
        data: dataList[index],
        maxWidth: dataList[index].iconWidth,
        onTab: (route) => _onItemTab(
          context,
          route,
        ),
      ),
    );
  }

  _onItemTab(BuildContext context, String route) {
    context.pushNamed(
      route,
    );
  }
}
