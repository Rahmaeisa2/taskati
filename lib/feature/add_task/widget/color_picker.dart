import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  final List<Color> availableColors;
  final int selectedIndex;
  final Function(int) onSelect;

  const ColorPicker({
    super.key,
    required this.availableColors,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(availableColors.length, (index) {
        return GestureDetector(
          onTap: () => onSelect(index),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: availableColors[index],

            ),
            width: 30,
            height: 30,
            child: selectedIndex == index ? Center(child: const Icon(Icons.check, color: Colors.white, size: 16)) : null,
          ),
        );
      }),
    );
  }
}
