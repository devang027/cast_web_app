import 'package:demo_web_app/utils/app_strings.dart';
import 'package:demo_web_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

import 'bottom_bar_column.dart';
import 'info_text.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Theme.of(context).canvasColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: 'Careers',
                    ),
                    BottomBarColumn(
                      heading: 'HELP',
                      s1: 'Payment',
                      s2: 'Cancellation',
                      s3: 'FAQ',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                  ],
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                const SizedBox(height: 20),
                const InfoText(
                  type: 'Email',
                  text: 'shivasandcast@gmail.com',
                ),
                const SizedBox(height: 5),
                const InfoText(
                  type: 'Address',
                  text:
                      'Survey no 64, Plot no 275, Shyam industrial park - 2,Bhavda road, Bakrol Bujrang, Ahmedabad 382430',
                ),
                const SizedBox(height: 20),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                const SizedBox(height: 20),
                Text(
                  'Copyright © 2025 | ${AppStrings.appName}',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                    fontFamily: AppStrings.fontMontserrat,
                  ),
                ),
              ],
            )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,

                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BottomBarColumn(
                            heading: 'ABOUT',
                            s1: 'Contact Us',
                            s2: 'About Us',
                            s3: 'Careers',
                          ),
                          BottomBarColumn(
                            heading: 'HELP',
                            s1: 'Payment',
                            s2: 'Cancellation',
                            s3: 'FAQ',
                          ),
                          BottomBarColumn(
                            heading: 'SOCIAL',
                            s1: 'Twitter',
                            s2: 'Facebook',
                            s3: 'YouTube',
                          ),
                          Container(
                            color: Colors.blueGrey,
                            width: 2,
                            height: 150,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoText(
                            type: 'Email',
                            text: 'shivasandcast@gmail.com',
                          ),
                          SizedBox(height: 5),
                          InfoText(
                            type: 'Address',
                            text:
                                'Survey no 64, Plot no 275, Shyam industrial park - 2,Bhavda road, Bakrol Bujrang, Ahmedabad 382430',
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blueGrey,
                    width: double.maxFinite,
                    height: 1,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Copyright © 2025 | ${AppStrings.appName}',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }
}
