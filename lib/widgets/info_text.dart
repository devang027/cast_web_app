import 'package:flutter/material.dart';

import '../utils/app_strings.dart';

class InfoText extends StatelessWidget {
  final String type;
  final String text;

  const InfoText({super.key, required this.type, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          '$type: ',
          style: TextStyle(
            color: Colors.black54,
            fontFamily: AppStrings.fontMontserrat,
            fontSize: 16,
          ),
        ),
        Flexible(
          child: SelectableText(
            text,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: AppStrings.fontMontserrat,
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }
}
