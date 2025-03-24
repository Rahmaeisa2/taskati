import 'package:flutter/cupertino.dart';

import 'day_container.dart';

class FilterDaysRow extends StatefulWidget {
  const FilterDaysRow({super.key});

  @override
  _FilterDaysRowState createState() => _FilterDaysRowState();
}

class _FilterDaysRowState extends State<FilterDaysRow> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: DayContainer(isActive: selectedIndex == index),
        );
      }),
    );
  }
}