import 'package:flutter/material.dart';

import '../quiz_screen/model/question_model.dart';
import '../utils/color_utils.dart';

Container reusableProgressBar(List<Question> steps, int activeIndex) {
  return Container(
    width: 200.0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        const SizedBox(
          width: 180.0,
          child: Divider(
            color: Colors.grey,
            thickness: 2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (int i = 0; i < steps.length; i++) ...[
              Icon(
                Icons.circle,
                color: i == activeIndex ? purple : Colors.grey,
                size: i == activeIndex ? 18.0 : 10.0,
              )
            ]
            // for (var step in steps)
            //   Icon(
            //     Icons.circle,
            //     color: step ==  activeIndex? Colors.redAccent[400] : Colors.grey,
            //     size: step == activeIndex ? 16.0 : 8.0,
            //   )
          ],
        )
      ],
    ),
  );
}
