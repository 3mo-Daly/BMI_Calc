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
    final width = MediaQuery.of(context).size.width;
    final sheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        isSelected();
      },
      child: Center(
        child: Container(
          width: width * 0.43,
          // height: height * 0.45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: selected ? ColorManager.accent : ColorManager.secondary,
          ),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(
                iecon,
                size: width * 0.25,
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
