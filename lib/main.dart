import 'package:demo_web_app/utils/app_strings.dart';
import 'package:demo_web_app/utils/theme_data.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: lightThemeData,
      darkTheme: darkThemeData,
      debugShowCheckedModeBanner: false,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: const HomePage(),
    );
  }
}

/*
import 'package:demo_web_app/product.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> productList = [for (int i = 1; i <= 25; i++) 'assets/pd$i.jpeg'];
String bgOne = "assets/main_background.webp";
String bgTwo = "assets/main_background_2.webp";
String bgThree = "assets/main_background_3.webp";
List<Product> products = [
  Product(
      title:
          'S G Iron Castings (Spheroidal Graphite Iron Castings / Nodular Iron Castings)',
      description:
          'S G Iron is also known as Spheroidal Graphite Iron, Ductile Cast Iron, Nodular Cast Iron, Spherulitic Graphite Cast Iron. S G Iron is a type of cast iron that has been treated while molten with an element such as magnesium or cerium to induce the formation of free graphite as nodules or spherulites. This imparts a measurable degree of ductility (easily manipulated) to the cast metal. The ductile iron family offers the design engineer a unique combination of strength, wear resistance, fatigue resistance, and toughness, as well as excellent ductility characteristics.S G Iron/Ductile iron is not a single material but is part of a group of materials which can be produced to have a wide range of properties through control of the microstructure. The common defining characteristic of this group of materials is the shape of the graphite. In ductile irons, the graphite is in the form of nodules rather than flakes as it is in grey iron. The sharp shape of the flakes of graphite create stress concentration points within the metal matrix and the rounded shape of the nodules less so, thus inhibiting the creation of cracks and providing the enhanced ductility that gives the alloy its name.This nodular graphite structure inhibits the creation of linear cracks hence the ability to withstand distortion.',
      specification: """Composition:
- Carbon 3.2 to 3.6%
- Silicon 2.2 to 2.8%
- Manganese 0.1 to 0.5%
- Magnesium 0.03 to 0.05%
- Phosphorus 0.005 to 0.04%
- Sulfur 0.005 to 0.02%
- Copper 0.40%
- Iron balance

Applications:
Ductile iron is useful in automotive components, off-highway diesel trucks, Class 8 trucks, agricultural tractors, and oil well pumps.

Specifications:
- IS – 1865 – 1998 (Third Reprint)
- Grades: SG – 350/22, SG – 400/15, SG – 450/10, SG – 500/7, SG – 600/3, SG – 700/2, SG – 800/2 & SG – 900/2.

Products:
Crank Gear, Separator Body Liner, Winch Drums, Elevator Blocks, Impellers, Valves, Hollow Cylinder, and various S G Iron Castings.
              """),
  Product(
      title: 'Cast Iron Castings (Graded) & Alloy C.I. Castings',
      description:
          'Cast iron is a hard, brittle alloy of iron and carbon that can be readily cast in a mold and contains a higher proportion of carbon than steel does. It is firm and unchangeable.We are leading manufacturer & exporter of Cast Iron Castings (Graded) & Alloy C.I. Castings which are available in both standard specifications and customized specifications, built as per the specifications given by the client. Latest design & fabrication techniques are used to manufacture our range of C.I. Castings to make these perfect for wide section of different applications.We are offering our clients, Cast Iron Castings (Graded) & Alloy C.I. Castings These are widely appreciated by our clients for their strength, durability and corrosion resistance. We can provide these in customized sizes and specifications in accordance with the requirements of our esteemed clients.We supply comprehensive range of Cast Iron Castings (Graded) & Alloy C.I. Castings which are extensively used in engineering and construction industries. Furthermore, these are manufactured in accordance with international standards and are delivered on time.',
      specification: """Specifications:
IS – 210 – 1993.
Grade – FG – 200/220, FG – 260, FG – 300, FG – 350
All Grades better Corrosion, wear and heat resisting.

Products:
Pump Casing, Chain Wheels, Frames of Filling & Cantering Machines, Crank Gear, Separator Body Liner, Bull Gear, Winch Drums, Fly Wheels, Elevator Blocks, Impellers, Valves, Hollow Cylinder, Friction Brake Drums (duly pressure tested 1000 P.S.I.), Drive Plates and other various types of Cast Iron Castings (Graded) & Alloy C.I. Castings.
              """),
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Contact Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: const Color(0xFFEFF8F7), // Light background color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () async {
                            await _launchEmail("shivasandcast@gmail.com");
                          },
                          child: const Icon(Icons.email,
                              color: Colors.blue, size: 18)),
                      const SizedBox(width: 5),
                      InkWell(
                          onTap: () async {
                            await _launchEmail("shivasandcast@gmail.com");
                          },
                          child: const Text(
                            "shivasandcast@gmail.com",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black87),
                          )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.phone, color: Colors.blue, size: 18),
                      const SizedBox(width: 5),
                      Flexible(child: callWidget("+91-8200721928")),
                      const SizedBox(width: 5),
                      Flexible(child: callWidget("+91-9558521521")),
                      const SizedBox(width: 5),
                      Flexible(child: callWidget("+91-9624650037"))
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Main Navigation Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.brown, Color(0xFFEFF8F7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo Section
                const Text(
                  "Shiva Sand Cast",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),
                ),
                Flexible(
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    controller: _tabController,
                    labelStyle: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    indicatorColor: Colors.white,
                    tabs: const [
                      Tab(text: 'Home'),
                      Tab(text: 'Products'),
                      Tab(text: 'About Us'),
                      Tab(text: 'Enquiry'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Navigation Menu
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                HomeTabView(_tabController),
                ProductsTabView(tabController: _tabController),
                AboutUsTabView(tabController: _tabController),
                EnquiryTabView(_tabController),
              ],
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
      child: Text(
        phone,
        style: const TextStyle(fontSize: 14, color: Colors.black87),
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

class HomeTabView extends StatelessWidget {
  const HomeTabView(TabController tabController, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Section
          SizedBox(
            height: MediaQuery.of(context).size.height,
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
                          'Quality Foundry Solutions',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
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
          const SizedBox(height: 30),
          const Divider(
            color: Colors.brown,
          ),
          const Center(
            child: Text(
              'Products',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),

          const Divider(
            color: Colors.brown,
          ),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: productList.map((item) {
                    return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(item));
                  }).toList(),
                ),
              )),
          // Services Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Divider(
                  color: Colors.brown,
                ),
                const Text(
                  'Services',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  color: Colors.brown,
                ),
                const SizedBox(height: 10),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: products.map((product) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SelectableText(
                                product.title,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SelectableText(
                                product.description,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 14,
                                  textBaseline: TextBaseline.alphabetic,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SelectableText(
                                product.specification,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Testimonials Section
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[50],
            padding: const EdgeInsets.all(8.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'INSPECTION & QUALITY',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SelectableText(
                    """Foundry
We have 2 stages of inspection in our foundry.

INSPECTION BEFORE SHOT BLASTING:
• Decoring of moulds.
• Knock out of runners & risers.
• Heat wise hardness checking of each batch by POLDI hardness tester.
• Visual inspection for crack or any other foundry defects.
• O.K. pieces sent for shot blasting.

INSPECTION AFTER SHOT BLASTING:
• Visual inspection before fettling.
• Critical wall thickness checking by dial calliper.
• Chipping and grinding by conventional method.
• Checking for chipping, grinding & any defects before Zn – Cr primer by dipping.
• Microstructure (random checking).

Foundry Related Test Reports:
• Foundry test reports as per A 3.1 EN 10204 certificate for each batch of casting.
• Dimensional test report for first article inspection.

Machine Shop
We have 3 stages of inspection in our machine shop:

1) Incoming Inspection:
• Inspect 100% incoming raw and machined components.
• Check visual defects in raw castings before machining.
• 100% dimension check for outsourced/pre-machined components.
• Assembly child part inspection as per control plan.

2) In-process Inspection:
• Inspect processes every batch for GD&T errors.
• Check first component for dimensional variation after setup change.
• Verify critical parameters using external CMM facility.

3) Final Inspection:
• Check dimensional accuracy as per drawing.
• Hydro testing for pressure-rated components.
• Inspect visual defects, foundry defects, dents, chatter marks, etc.
• Perform assembly inspection, hydro testing, and working inspection.
• Inspect packing for defects in exports/domestic shipments.
• Pre-dispatch inspection for technical and commercial documentation.

Machine Shop Related Test Reports:
• Dimensional inspection reports as per control plan.
• Hydro test report for component pressure rating.
• Assembly inspection report as per drawing requirement.
• CMM reports for GD&T for first article inspection or changes in machining process.
""",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ),

          // Footer Section
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blueGrey[900],
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  */
/*© 2024*/ /*

                  'Address',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SelectableText(
                      'Survey no 64, Plot no 275, Shyam industrial park - 2,\nBhavda road, Bakrol Bujrang, Ahmedabad 382430',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    IconButton(
                        onPressed: () async {
                          if (!await launchUrl(Uri.parse(
                              "https://maps.app.goo.gl/yhvJiuQzBtedEBiu5"))) {
                            throw Exception(
                                'Could not launch ${Uri.parse("https://maps.app.goo.gl/yhvJiuQzBtedEBiu5")}');
                          }
                        },
                        icon: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                */
/* const Wrap(
                  spacing: 16,
                  children: [
                    Text(
                      'Privacy Policy',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      'Terms of Service',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      'Contact Us',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),*/
/*

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsTabView extends StatelessWidget {
  final TabController tabController;

  const ProductsTabView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Header Section
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.brown,
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Our Products',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore our range of high-quality products designed for your needs.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Product Grid Section
          Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: productList.map((item) {
                    return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset(item));
                  }).toList(),
                ),
              )),

          // Footer Section
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            color: Colors.blueGrey[900],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Looking for something specific?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    tabController.animateTo(3);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child:
                      const Text('Contact Us', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUsTabView extends StatelessWidget {
  final TabController tabController;

  const AboutUsTabView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          // Header Section
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.brown,
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
            ),
            child: const Column(
              children: [
                Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Learn more about our journey and mission.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Content Section
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectableText(
                  'We “SHIVA SAND CAST” introduce ourselves as a company with a professional approach that is aimed at result orientation.\nSHIVA SAND CAST has built up a modern manufacturing complex consisting of Pattern Shop, Moulding, Melting, Fettling, and Heat-Treatment, Shot-Blasting, Machine Shop and other testing facilities including destructive non-destructive test, hydro test, a pneumatic test required for quality production of ferrous/non-ferrous castings.\nThese facilities are developed with experience so as to create a capable as well as sustainable infrastructure to meet stringent national and international standards therein.',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SelectableText(
                  '\n\nWhy SHIVA SAND CAST?\n- Quick Response Time.Quality Performance.\n\n- On-time job completion.\n\n- Low Overheads for Clients.\n\n- One-to-One Customer Support.\n\n- Client Satisfaction Guaranteed.',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class EnquiryTabView extends StatelessWidget {
  EnquiryTabView(TabController tabController, {super.key});

  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String message = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Header Section
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.brown,
              border: Border(
                bottom: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
            ),
            child: const Column(
              children: [
                Text(
                  'Enquiry Form',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'We’d love to hear from you! Fill out the form below to reach out to us.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),

          // Form Section
          SizedBox(
            height: MediaQuery.of(context).size.height,
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
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[300]!, width: 1),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Shiva Sand Cast',
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                callWidget("+91-8200721928"),
                                callWidget("+91-9558521521"),
                                callWidget("+91-9624650037"),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onTap: () async {
                                          await _launchEmail(
                                              "shivasandcast@gmail.com");
                                        },
                                        child: const Icon(Icons.email,
                                            color: Colors.blue, size: 18)),
                                    const SizedBox(width: 5),
                                    Flexible(
                                      child: InkWell(
                                          onTap: () async {
                                            await _launchEmail(
                                                "shivasandcast@gmail.com");
                                          },
                                          child: const SelectableText(
                                            "shivasandcast@gmail.com",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 3.0,
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            maxLength: 70,
                                            onSaved: (value) =>
                                                name = value ?? '',
                                            validator: (value) =>
                                                value == null || value.isEmpty
                                                    ? 'Please enter your name'
                                                    : null,
                                            decoration: InputDecoration(
                                              labelText: 'Your Name',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            maxLength: 64,
                                            onSaved: (value) =>
                                                email = value ?? '',
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please enter your email';
                                              }
                                              final regex = RegExp(
                                                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                                              if (!regex.hasMatch(value)) {
                                                return 'Please enter a valid email';
                                              }
                                              return null; // Input is valid
                                            },
                                            decoration: InputDecoration(
                                              labelText: 'Your Email',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            maxLines: 4,
                                            onSaved: (value) =>
                                                message = value ?? '',
                                            validator: (value) => value ==
                                                        null ||
                                                    value.isEmpty
                                                ? 'Please enter your message'
                                                : null,
                                            maxLength: 500,
                                            decoration: InputDecoration(
                                              labelText: 'Your Message',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          ElevatedButton(
                                            onPressed: () async {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                _formKey.currentState!.save();
                                                //await _launchEmail(email);
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.blueAccent,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 32,
                                                      vertical: 12),
                                            ),
                                            child: const Text(
                                              'Submit',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
*/
