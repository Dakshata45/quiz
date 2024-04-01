import 'package:flutter/material.dart';

import '../utils/color_utils.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    super.key,
    required this.result,
    required this.questionLength,
    required this.onPressed,
  });
  final int result;
  final int questionLength;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Image.asset('images/trophy.png'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Text(
            'Congratulations !',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Divider(),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.help,
                          size: 20,
                          color: purple,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          questionLength.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'Total Que',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: VerticalDivider(
                    thickness: 2,
                    width: 2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 20,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          result.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'Correct',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: VerticalDivider(
                    thickness: 2,
                    width: 2,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.cancel,
                          size: 20,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          (questionLength - result).toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'Wrong',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 25.0),
          Text(
            result == questionLength / 2
                ? 'Almost There' // when the result is half of the questions
                : result < questionLength / 2
                    ? 'Try Again ?' // when the result is less than half
                    : 'Great!', // when the result is more than half
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.lightBlueAccent),
          ),
          const SizedBox(height: 10.0),
          GestureDetector(
            onTap: onPressed,
            child: const Text(
              'Start Over',
              style: TextStyle(
                color: purple,
                fontSize: 20.0,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
