import 'package:demo_web_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../utils/app_strings.dart';

class DestinationHeading extends StatelessWidget {
  const DestinationHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Container(
              width: screenSize.width,
              // color: Colors.black,
              child: const Text(
                'Services',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: AppStrings.fontMontserrat,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : Container(
              width: screenSize.width,
              // color: Colors.black,
              child: const Text(
                'Services',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: AppStrings.fontMontserrat,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
