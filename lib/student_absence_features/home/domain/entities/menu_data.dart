class MenuItemData {
  final String title;
  final String svg;
  final String route;
  final double iconWidth;

  MenuItemData({
    required this.title,
    required this.svg,
    required this.route,
    this.iconWidth = 70,
  });
}
