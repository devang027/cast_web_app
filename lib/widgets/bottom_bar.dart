import 'package:demo_web_app/utils/app_strings.dart';
import 'package:demo_web_app/widgets/responsive.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bottom_bar_column.dart';
import 'info_text.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Theme.of(context).canvasColor,
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              children: [
                /*Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomBarColumn(
                      heading: 'ABOUT',
                      s1: 'Contact Us',
                      s2: 'About Us',
                      s3: '',
                    ),
                    BottomBarColumn(
                      heading: 'SOCIAL',
                      s1: 'Twitter',
                      s2: 'Facebook',
                      s3: 'YouTube',
                    ),
                  ],
                ),*/
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () async {
                    await _launchEmail("shivasandcast@gmail.com");
                  },
                  child: const InfoText(
                    type: 'Email',
                    text: 'shivasandcast@gmail.com',
                  ),
                ),
                const SizedBox(height: 5),
                const InfoText(
                  type: 'Address',
                  text:
                      'Survey no 64, Plot no 275, Shyam industrial park - 2,Bhavda road, Bakrol Bujrang, Ahmedabad 382430',
                ),
                const SizedBox(height: 20),
                const InfoText(
                  type: 'Contact No',
                  text: '+91-8200721928 | +91-9558521521 | +91-9624650037',
                ),
                Container(
                  color: Colors.blueGrey,
                  width: double.maxFinite,
                  height: 1,
                ),
                const SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Copyright © 2025 | ${AppStrings.appName}\nManage by: Dev Pr Work',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                    fontFamily: AppStrings.fontMontserrat,
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    /*Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BottomBarColumn(
                            heading: 'ABOUT',
                            s1: 'Contact Us',
                            s2: 'About Us',
                            s3: '',
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
                    ),*/
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () async {
                                await _launchEmail("shivasandcast@gmail.com");
                              },
                              child: const InfoText(
                                type: 'Email',
                                text: 'shivasandcast@gmail.com',
                              )),
                          const SizedBox(height: 5),
                          const InfoText(
                            type: 'Address',
                            text:
                                'Survey no 64, Plot no 275, Shyam industrial park - 2,Bhavda road, Bakrol Bujrang, Ahmedabad 382430',
                          ),
                          const SizedBox(height: 5),
                          const InfoText(
                            type: 'Contact No',
                            text: '+91-8200721928 | +91-9558521521 | +91-9624650037',
                          ),
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
                  textAlign: TextAlign.center,
                  'Copyright © 2025 | ${AppStrings.appName}\nManage by: Dev Pr Work',
                  style: TextStyle(
                    color: Colors.blueGrey[300],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
    );
  }

  callWidget(String phone) {
    return InkWell(
      onTap: () async {
        await _makePhoneCall(phone);
      },
      child: SelectableText(
        phone,
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }

  Future<void> _makePhoneCall(String number) async {
    final Uri callUri = Uri(
      scheme: 'tel',
      path: number,
    );

    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      throw 'Could not launch $callUri';
    }
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Enquiry&body=How can I help you?',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
