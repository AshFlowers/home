import 'package:flutter/widgets.dart';

class AdvancedTile {
  final String title;
  final String url;
  final IconData? icon;
  final List<AdvancedTile> tiles;

  const AdvancedTile({
    required this.title,
    this.url = '',
    this.icon,
    this.tiles = const [],
  });
}
