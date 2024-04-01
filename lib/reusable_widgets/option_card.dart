import 'package:flutter/material.dart';
import 'package:quiz_app/reusable_widgets/reusable_button.dart';

import '../utils/color_utils.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.option,
    required this.index,
    required this.color,
    required this.onTap
  });
  final String option;
  final String index;
  final Color color;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return reusableButton(context: context, btnText: '$index) $option', side: BorderSide(
      color: color == redLight ? incorrect :color == greenLight? correct : Colors.grey,
      width: 1.0,
    ),
    txtColor: Colors.black,
        bgColor:  color.withOpacity(0.9), onTap: onTap,
    );
  }
}

