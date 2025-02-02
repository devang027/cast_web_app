import 'package:demo_web_app/utils/app_strings.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

import '../widgets/bottom_bar.dart';
import '../widgets/carousel.dart';
import '../widgets/destination_heading.dart';
import '../widgets/explore_drawer.dart';
import '../widgets/featured_heading.dart';
import '../widgets/featured_tiles.dart';
import '../widgets/floating_quick_access_bar.dart';
import '../widgets/responsive.dart';
import '../widgets/top_bar_contents.dart';
import '../widgets/web_scrollbar.dart';

String bgOne = "assets/main_background.webp";
String bgTwo = "assets/main_background_2.webp";
String bgThree = "assets/main_background_3.webp";

class HomePage extends StatefulWidget {
  static const String route = '/';

  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Colors.grey,
      extendBodyBehindAppBar: true,
      /*appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
        backgroundColor: Colors.black.withOpacity(_opacity),
              elevation: 0,
              centerTitle: true,
             *//* actions: [
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onPressed: () {
                    EasyDynamicTheme.of(context).changeTheme();
                  },
                ),
              ],*//*
              title: Text(
                AppStrings.appName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: AppStrings.fontMontserrat,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 3,
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: TopBarContents(_opacity),
            ),*/
      //drawer: const ExploreDrawer(),
      body: WebScrollbar(
        color: Colors.black,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* Stack(
                children: [
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.30,
                      width: screenSize.width,
                      child: Image.asset(
                        bgOne,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FloatingQuickAccessBar(screenSize: screenSize),
                ],
              ),*/
              SizedBox(
                height: screenSize.height,
                width: screenSize.width,
                child: Stack(
                  children: [
                    // Background Image
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(bgOne),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Transparent Black Overlay
                    Container(
                      color: Colors.black
                          .withOpacity(0.5), // Adjust the opacity as needed
                    ),
                    // Centered Text Content
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              AppStrings.appName,
                              style: TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: AppStrings.fontElectrolize
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Delivering top-notch ferrous and non-ferrous castings',
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: AppStrings.fontElectrolize,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              ProductHeading(
                screenSize: screenSize,
              ),
              ProductTiles(screenSize: screenSize),
              DestinationHeading(screenSize: screenSize),
              DestinationCarousel(),
              SizedBox(height: screenSize.height / 10),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
