import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/entities/navgation_page_data.dart';

class TopNavigatorDrawer extends StatelessWidget {
  const TopNavigatorDrawer({
    super.key,
    required this.pages,
    required this.onPressed,
  });

  final List<NavigationPageData> pages;
  final void Function(int) onPressed;

  int get _centerIndex => (pages.length-1) ~/ 2;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 26,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (final (index, page) in pages.indexed)
              if (index != _centerIndex)
                IconButton(
                  onPressed: () => onPressed(index),
                  icon: SvgPicture.asset(
                    page.svg,
                    height: 35,
                    colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.surface,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              else
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: IconButton(
                    onPressed: () => onPressed(index),
                    icon: SvgPicture.asset(
                      page.svg,
                      height: 40,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.primaryContainer,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
