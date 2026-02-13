import 'package:flutter/material.dart';
import 'package:moksha_path/features/register/domain/entities/academic_item.dart';
import 'package:moksha_path/features/register/domain/entities/academic_year.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

/// A dropdown list for [AcademicItem] objects (boards, schools, classes).
class AcademicItemDropdownList extends StatelessWidget {
  final List<AcademicItem> items;
  final ValueChanged<AcademicItem> onSelect;
  final String emptyText;

  const AcademicItemDropdownList({
    super.key,
    required this.items,
    required this.onSelect,
    this.emptyText = 'No items found',
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(emptyText),
      );
    }
    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: const BoxConstraints(maxHeight: 180),
      decoration: BoxDecoration(
        color: AppTheme.of(context).background,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (_, i) => ListTile(
          dense: true,
          title: Text(items[i].name),
          onTap: () => onSelect(items[i]),
        ),
      ),
    );
  }
}

/// A dropdown list for [AcademicYear] objects.
class AcademicYearDropdownList extends StatelessWidget {
  final List<AcademicYear> items;
  final ValueChanged<AcademicYear> onSelect;
  final String emptyText;

  const AcademicYearDropdownList({
    super.key,
    required this.items,
    required this.onSelect,
    this.emptyText = 'No years found',
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(emptyText),
      );
    }
    return Container(
      margin: const EdgeInsets.only(top: 4),
      constraints: const BoxConstraints(maxHeight: 180),
      decoration: BoxDecoration(
        color: AppTheme.of(context).background,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (_, i) => ListTile(
          dense: true,
          title: Text(items[i].year),
          onTap: () => onSelect(items[i]),
        ),
      ),
    );
  }
}
