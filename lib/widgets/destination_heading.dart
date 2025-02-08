import 'package:demo_web_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../utils/app_strings.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key? key,
    required this.headerText,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? SizedBox(
              width: screenSize.width,
              // color: Colors.black,
              child: Text(
                headerText,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 24,
                  fontFamily: AppStrings.fontMontserrat,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : SizedBox(
              width: screenSize.width,
              // color: Colors.black,
              child: Text(
                headerText,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 40,
                  fontFamily: AppStrings.fontMontserrat,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
