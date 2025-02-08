import 'package:demo_web_app/utils/app_strings.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

String workEmail = "shivasandcast@gmail.com";
String phoneOne = "+91-8200721928";
String phoneTwo = "+91-9558521521";
String phoneThree = "+91-9624650037";

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
  bool isScrolledUp = true;

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _productsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _aboutUsKey = GlobalKey();
  final GlobalKey _inspectionKey = GlobalKey();

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      isScrolledUp = _scrollController.position.pixels <= 250;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
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
      body: WebScrollbar(
        color: Colors.black,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        heightFraction: 0.3,
        controller: _scrollController,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.height,
                    width: screenSize.width,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(bgOne),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(color: Colors.black.withOpacity(0.5)),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.linearToEaseOut,
                          top: isScrolledUp ? screenSize.height * 0.4 : 10,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppStrings.appName,
                                  style: TextStyle(
                                    fontSize: isScrolledUp ? 45 : 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: AppStrings.fontElectrolize,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Visibility(
                                visible: isScrolledUp,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    AppStrings.quote,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: AppStrings.fontElectrolize,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      key: _productsKey,
                      child: ProductHeading(screenSize: screenSize)),
                  ProductTiles(screenSize: screenSize),
                  Container(
                      key: _servicesKey,
                      child: DestinationHeading(
                          headerText: "Services", screenSize: screenSize)),
                  DestinationCarousel(),
                  Container(
                      key: _aboutUsKey,
                      child: DestinationHeading(
                          headerText: "About Us", screenSize: screenSize)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenSize.width < 600 ? 16 : screenSize.width / 15,
                      vertical:
                          screenSize.height < 800 ? 10 : screenSize.height / 30,
                    ),
                    color: Theme.of(context).canvasColor,
                    width: screenSize.width,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontFamily: AppStrings.fontMontserrat,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "We “SHIVA SAND CAST” introduce ourselves as a company with a professional approach that is aimed at result orientation. SHIVA SAND CAST has built up a modern manufacturing complex consisting of Pattern Shop, Moulding, Melting, Fettling, and Heat-Treatment, Shot-Blasting, Machine Shop and other testing facilities including destructive non-destructive test, hydro test, a pneumatic test required for quality production of ferrous/non-ferrous castings. These facilities are developed with experience so as to create a capable as well as sustainable infrastructure to meet stringent national and international standards therein.\n\n",
                          ),
                          TextSpan(
                            text: "Why SHIVA SAND CAST?\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "• Quick Response Time.\n"),
                          TextSpan(text: "• Quality Performance.\n"),
                          TextSpan(text: "• On-time job completion.\n"),
                          TextSpan(text: "• Low Overheads for Clients.\n"),
                          TextSpan(text: "• One-to-One Customer Support.\n"),
                          TextSpan(
                              text: "• Client Satisfaction Guaranteed.\n\n"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      key: _inspectionKey,
                      child: DestinationHeading(
                          headerText: "Inspection & Quality",
                          screenSize: screenSize)),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenSize.width < 600 ? 16 : screenSize.width / 15,
                      vertical:
                          screenSize.height < 800 ? 10 : screenSize.height / 30,
                    ),
                    color: Theme.of(context).canvasColor,
                    width: screenSize.width,
                    child: const Text(
                      "Foundry Inspection\n\n"
                      "1. Inspection Before Shot Blasting\n"
                      "- Decoring of moulds.\n"
                      "- Knock out of runners & risers.\n"
                      "- Heat-wise hardness checking of each batch using Poldi Hardness Tester.\n"
                      "- Visual inspection for cracks or any other foundry defects.\n"
                      "- O.K. pieces sent for shot blasting.\n\n"
                      "2. Inspection After Shot Blasting\n"
                      "- Visual inspection before fettling.\n"
                      "- Critical wall thickness checking using a dial caliper.\n"
                      "- Chipping and grinding by conventional methods.\n"
                      "- Final inspection of chipping, grinding, and any defects before Zn – Cr primer dipping.\n"
                      "- Random checking of microstructure.\n\n"
                      "Foundry-Related Test Reports\n"
                      "- Foundry test reports as per A 3.1 EN 10204 Certificate of Compliance.\n"
                      "- Casting dimensional test report for first article inspection.\n\n"
                      "Machine Shop Inspection\n\n"
                      "1. Incoming Inspection\n"
                      "- 100% inspection of raw and machined components entering the machine shop.\n"
                      "- Visual defect check in raw castings before machining.\n"
                      "- Dimensional check for outsourced or pre-machined components.\n"
                      "- Assembly child part inspection as per control plan frequency and specifications.\n\n"
                      "2. In-Process Inspection\n"
                      "- Process inspection for batch errors related to GD&T.\n"
                      "- First component check for dimensional variation after every setup change.\n"
                      "- Verification of critical parameters using an external CMM facility, if required.\n\n"
                      "3. Final Inspection\n"
                      "- Dimensional accuracy checked against drawings.\n"
                      "- Hydro testing of pressure-rated components at maximum working pressure (100% of components).\n"
                      "- Inspection of visual defects, foundry defects, dents, chatter marks, etc.\n"
                      "- Assembly inspection for hydro testing and functional validation.\n"
                      "- Packing inspection for defects in packaging for exports or domestic shipments.\n"
                      "- Pre-dispatch inspection to verify technical and commercial documentation as per purchase order.\n\n"
                      "Machine Shop-Related Test Reports\n"
                      "- Dimensional inspection reports as per the control plan.\n"
                      "- Hydro test reports based on component pressure rating.\n"
                      "- Assembly inspection report as per assembly drawing requirements.\n"
                      "- CMM reports for GD&T for first article inspection or changes in machining processes.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: AppStrings.fontMontserrat,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height / 10),
                  const BottomBar(),
                ],
              ),
            ),
            /*Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black.withOpacity(0.8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          Expanded(child: _navButton("Products", _productsKey)),
                          Expanded(child: _navButton("Services", _servicesKey)),
                          Expanded(child: _navButton("About Us", _aboutUsKey)),
                          Expanded(
                              child: _navButton(
                                  "Inspection & Quality", _inspectionKey)),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !isScrolledUp,
                      child: Expanded(
                        child: Text(
                          AppStrings.appName,
                          style: TextStyle(
                            fontSize: isScrolledUp ? 45 : 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: AppStrings.fontElectrolize,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Wrap(
                              children: [
                                Flexible(
                                  child: InkWell(
                                    onTap: () async {
                                      await _launchEmail(workEmail);
                                    },
                                    child: const Icon(Icons.email,
                                        color: Colors.blue, size: 18),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                InkWell(
                                  onTap: () async {
                                    await _launchEmail(workEmail);
                                  },
                                  child: Text(
                                    workEmail,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontFamily: AppStrings.fontElectrolize),
                                  ),
                                ),
                              ],
                            ),
                            Wrap(
                              children: [
                                const Icon(Icons.phone,
                                    color: Colors.blue, size: 18),
                                const SizedBox(width: 5),
                                Flexible(child: callWidget(phoneOne)),
                                const SizedBox(width: 5),
                                Flexible(child: callWidget(phoneTwo)),
                                const SizedBox(width: 5),
                                Flexible(child: callWidget(phoneThree)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )*/
          ],
        ),
      ),
    );
  }

  Widget _navButton(String title, GlobalKey key) {
    return TextButton(
      onPressed: () => _scrollToSection(key),
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  callWidget(String phone) {
    return InkWell(
      onTap: () async {
        await _makePhoneCall(phone);
      },
      child: Text(
        phone,
        style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: AppStrings.fontMontserrat),
      ),
    );
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=Enquiry&body=How can I help you?', // Add subject and body (optional)
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
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
}

/*class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;
  bool isScrolledUp = true; // Track scroll direction

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
      if (_scrollController.position.pixels > 250) {
        // If scrolled down, move text to the top
        if (isScrolledUp) {
          setState(() {
            isScrolledUp = false;
          });
        }
      } else {
        // If at top, keep text at the center
        if (!isScrolledUp) {
          setState(() {
            isScrolledUp = true;
          });
        }
      }
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
      body: WebScrollbar(
        color: Colors.black,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        heightFraction: 0.3,
        controller: _scrollController,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        Container(color: Colors.black.withOpacity(0.5)),

                        // Animated Header Text Position
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.linearToEaseOut,
                          top: isScrolledUp ? screenSize.height * 0.4 : 10,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  AppStrings.appName,
                                  style: TextStyle(
                                    fontSize: isScrolledUp ? 45 : 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: AppStrings.fontElectrolize,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Visibility(
                                visible: isScrolledUp,
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    AppStrings.quote,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: AppStrings.fontElectrolize,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProductHeading(screenSize: screenSize),
                  ProductTiles(screenSize: screenSize),
                  DestinationHeading(
                      headerText: "Services", screenSize: screenSize),
                  DestinationCarousel(),
                  DestinationHeading(
                      headerText: "About Us", screenSize: screenSize),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenSize.width < 600 ? 16 : screenSize.width / 15,
                      vertical:
                          screenSize.height < 800 ? 10 : screenSize.height / 30,
                    ),
                    color: Theme.of(context).canvasColor,
                    width: screenSize.width,
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          fontFamily: AppStrings.fontMontserrat,
                        ),
                        children: [
                          TextSpan(
                            text:
                                "We “SHIVA SAND CAST” introduce ourselves as a company with a professional approach that is aimed at result orientation. SHIVA SAND CAST has built up a modern manufacturing complex consisting of Pattern Shop, Moulding, Melting, Fettling, and Heat-Treatment, Shot-Blasting, Machine Shop and other testing facilities including destructive non-destructive test, hydro test, a pneumatic test required for quality production of ferrous/non-ferrous castings. These facilities are developed with experience so as to create a capable as well as sustainable infrastructure to meet stringent national and international standards therein.\n\n",
                          ),
                          TextSpan(
                            text: "Why SHIVA SAND CAST?\n",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "• Quick Response Time.\n"),
                          TextSpan(text: "• Quality Performance.\n"),
                          TextSpan(text: "• On-time job completion.\n"),
                          TextSpan(text: "• Low Overheads for Clients.\n"),
                          TextSpan(text: "• One-to-One Customer Support.\n"),
                          TextSpan(
                              text: "• Client Satisfaction Guaranteed.\n\n"),
                        ],
                      ),
                    ),
                  ),
                  DestinationHeading(
                      headerText: "Inspection & Quality",
                      screenSize: screenSize),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          screenSize.width < 600 ? 16 : screenSize.width / 15,
                      vertical:
                          screenSize.height < 800 ? 10 : screenSize.height / 30,
                    ),
                    color: Theme.of(context).canvasColor,
                    width: screenSize.width,
                    child: const Text(
                      "Foundry Inspection\n\n"
                      "1. Inspection Before Shot Blasting\n"
                      "- Decoring of moulds.\n"
                      "- Knock out of runners & risers.\n"
                      "- Heat-wise hardness checking of each batch using Poldi Hardness Tester.\n"
                      "- Visual inspection for cracks or any other foundry defects.\n"
                      "- O.K. pieces sent for shot blasting.\n\n"
                      "2. Inspection After Shot Blasting\n"
                      "- Visual inspection before fettling.\n"
                      "- Critical wall thickness checking using a dial caliper.\n"
                      "- Chipping and grinding by conventional methods.\n"
                      "- Final inspection of chipping, grinding, and any defects before Zn – Cr primer dipping.\n"
                      "- Random checking of microstructure.\n\n"
                      "Foundry-Related Test Reports\n"
                      "- Foundry test reports as per A 3.1 EN 10204 Certificate of Compliance.\n"
                      "- Casting dimensional test report for first article inspection.\n\n"
                      "Machine Shop Inspection\n\n"
                      "1. Incoming Inspection\n"
                      "- 100% inspection of raw and machined components entering the machine shop.\n"
                      "- Visual defect check in raw castings before machining.\n"
                      "- Dimensional check for outsourced or pre-machined components.\n"
                      "- Assembly child part inspection as per control plan frequency and specifications.\n\n"
                      "2. In-Process Inspection\n"
                      "- Process inspection for batch errors related to GD&T.\n"
                      "- First component check for dimensional variation after every setup change.\n"
                      "- Verification of critical parameters using an external CMM facility, if required.\n\n"
                      "3. Final Inspection\n"
                      "- Dimensional accuracy checked against drawings.\n"
                      "- Hydro testing of pressure-rated components at maximum working pressure (100% of components).\n"
                      "- Inspection of visual defects, foundry defects, dents, chatter marks, etc.\n"
                      "- Assembly inspection for hydro testing and functional validation.\n"
                      "- Packing inspection for defects in packaging for exports or domestic shipments.\n"
                      "- Pre-dispatch inspection to verify technical and commercial documentation as per purchase order.\n\n"
                      "Machine Shop-Related Test Reports\n"
                      "- Dimensional inspection reports as per the control plan.\n"
                      "- Hydro test reports based on component pressure rating.\n"
                      "- Assembly inspection report as per assembly drawing requirements.\n"
                      "- CMM reports for GD&T for first article inspection or changes in machining processes.",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: screenSize.height / 10),
                  const BottomBar(),
                ],
              ),
            ),

            // Sticky Header
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: ResponsiveWidget.isSmallScreen(context)
                        ? screenSize.height * 0.065
                        : 40,
                    padding: const EdgeInsets.all(8),
                    color: !isScrolledUp
                        ? Colors.black
                        : Colors.black.withOpacity(0.8),
                    child: ResponsiveWidget.isSmallScreen(context)
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await _launchEmail(workEmail);
                                    },
                                    child: const Icon(Icons.email,
                                        color: Colors.blue, size: 18),
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    onTap: () async {
                                      await _launchEmail(workEmail);
                                    },
                                    child: Text(
                                      workEmail,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily:
                                              AppStrings.fontMontserrat),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.phone,
                                      color: Colors.blue, size: 18),
                                  const SizedBox(width: 5),
                                  Flexible(child: callWidget(phoneOne)),
                                  const SizedBox(width: 5),
                                  Flexible(child: callWidget(phoneTwo)),
                                  const SizedBox(width: 5),
                                  Flexible(child: callWidget(phoneThree))
                                ],
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await _launchEmail(workEmail);
                                      },
                                      child: const Icon(Icons.email,
                                          color: Colors.blue, size: 18),
                                    ),
                                    const SizedBox(width: 5),
                                    InkWell(
                                      onTap: () async {
                                        await _launchEmail(workEmail);
                                      },
                                      child: Text(
                                        workEmail,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontFamily:
                                                AppStrings.fontElectrolize),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: isScrolledUp == true ? false : true,
                                child: const Text(
                                  AppStrings.appName,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: AppStrings.fontElectrolize,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(Icons.phone,
                                        color: Colors.blue, size: 18),
                                    const SizedBox(width: 5),
                                    Flexible(child: callWidget(phoneOne)),
                                    const SizedBox(width: 5),
                                    Flexible(child: callWidget(phoneTwo)),
                                    const SizedBox(width: 5),
                                    Flexible(child: callWidget(phoneThree)),
                                  ],
                                ),
                              ),
                            ],
                          )))
          ],
        ),
      ),
    );
  }

  callWidget(String phone) {
    return InkWell(
      onTap: () async {
        await _makePhoneCall(phone);
      },
      child: Text(
        phone,
        style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: AppStrings.fontMontserrat),
      ),
    );
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query:
          'subject=Enquiry&body=How can I help you?', // Add subject and body (optional)
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
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
}*/
