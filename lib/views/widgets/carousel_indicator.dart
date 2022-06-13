import 'package:flutter/material.dart';

import '../../utils/themes/app_theme.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    Key? key,
    required this.selected,
  }) : super(key: key);

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: AnimatedContainer(
        height: 5,
        width: selected ? 10 : 5,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius:
              selected ? BorderRadius.circular(20) : BorderRadius.circular(100),
          shape: BoxShape.rectangle,
          color: selected
              ? AppTheme.theme(context).colorScheme.primary
              : kGreyColor,
        ),
      ),
    );
  }
}
