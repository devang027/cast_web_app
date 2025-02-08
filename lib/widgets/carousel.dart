import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_web_app/widgets/responsive.dart';
import 'package:flutter/material.dart';

import '../product.dart';
import '../utils/app_strings.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/';
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  final List<bool> _isHovering = List.generate(25, (index) => false);
  final List<bool> _isSelected = List.generate(25, (index) => index == 0);

  List<String> images = [for (int i = 1; i <= 25; i++) 'assets/pd$i.jpeg'];
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

  List<Widget> generateImageTiles(screenSize) {
    return products.map((product) {
      return IntrinsicHeight(
        // Allows dynamic height
        child: Card(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // Ensures the Column wraps content dynamically
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SelectableText(
                    product.title,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontFamily: AppStrings.fontMontserrat,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 25),
                  child: SelectableText(
                    product.description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontFamily: AppStrings.fontMontserrat,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: screenSize.width / 25),
                  child: SelectableText(
                    product.specification,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                      fontFamily: AppStrings.fontMontserrat,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return StatefulBuilder(
      builder: (context, setState) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: getCurrentHeight(screenSize),
          width: screenSize.width,
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              scrollPhysics: ResponsiveWidget.isSmallScreen(context)
                  ? const PageScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            carouselController: _controller,
          ),
        );
      },
    );
  }

  double getCurrentHeight(Size screenSize) {
    // Define height dynamically based on current index
    return screenSize.height * 0.5; // Adjust this logic if needed
  }
}
