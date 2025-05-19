import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigationPageData extends Equatable {
  final String title;
  final Widget page;
  final String svg;

  const NavigationPageData({
    required this.title,
    required this.page,
    required this.svg,
  });

  @override
  List<Object?> get props => [
        title,
        page,
      ];
}
