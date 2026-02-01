import 'package:flutter/material.dart';
import 'package:week_7_activity/core/color_manager.dart';
import '../../../core/styles.dart';

class GenderSelect extends StatelessWidget {
  final IconData iecon;
  final String label;
  final Function() isSelected; // onTap callback function search
  final bool selected;
  const GenderSelect({
    super.key,
    required this.iecon,
    required this.label,
    required this.isSelected,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          isSelected();
          
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selected ? ColorManager.accent : ColorManager.secondary,
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Icon(
                iecon,
                size: 100,
                color: Colors.white,
              ),
              Text(
                label,
                style: Styles.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
