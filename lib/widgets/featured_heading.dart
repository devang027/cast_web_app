import 'package:demo_web_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../utils/app_strings.dart';

class ProductHeading extends StatelessWidget {
  const ProductHeading({
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
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(),
                Text(
                  'Products',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: AppStrings.fontMontserrat,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Visibility(
                  visible: false,
                  child: Text(
                    'Unique wildlife tours & destinations',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).primaryTextTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 10),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Products',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: AppStrings.fontMontserrat,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Visibility(
                   visible: false,
                  child: Expanded(
                    child: Text(
                      'Unique wildlife tours & destinations',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
