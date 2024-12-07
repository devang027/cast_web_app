import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return /*Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () async {
                      await _makePhoneCall("");
                    },
                    child: const Icon(Icons.phone)),
                const SizedBox(width: 10),
                const Flexible(
                  child: Text('94287 07047 I 94290 66811',
                      softWrap: true, style: TextStyle(fontSize: 22)),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                    onTap: () async {
                      await _launchEmail("shivasandcast@gmail.com");
                    },
                    child: const Icon(Icons.email)),
                const SizedBox(width: 10),
                const Flexible(
                    child: Text('shivasandcast@gmail.com',
                        softWrap: true, style: TextStyle(fontSize: 20))),
              ],
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Home'),
            Tab(text: 'Products'),
            Tab(text: 'About Us'),
            Tab(text: 'Enquiry'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeTabView(_tabController),
          ProductsTabView(tabController: _tabController),
          AboutUsTabView(tabController: _tabController),
          EnquiryTabView(_tabController),
        ],
      ),
    );*/
        Scaffold(
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
                              color: Colors.red, size: 18)),
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
                      const Icon(Icons.phone, color: Colors.red, size: 18),
                      const SizedBox(width: 5),
                      Flexible(child: callWidget("+91-9624650037")),
                      const SizedBox(width: 5),
                      Flexible(child: callWidget("+91-8200721928")),
                      const SizedBox(width: 5),
                      Flexible(child: callWidget("+91-9558521521"))
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        child: Image.asset(
                          'assets/logo.jpeg',
                          // Replace with your logo URL
                          height: 50,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "SSC",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
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
          'subject=Hello&body=How can I help you?', // Add subject and body (optional)
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
            height: MediaQuery.of(context).size.height / 3.0,
            child: Stack(
              children: [
                // Background Image
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/bg_home.png"),
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
                      Text(
                        'SSC',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'SHIVA SAND CAST',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                     /* Container(
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        color: Colors.amber,
                        child: const Text(
                          'Mfg. Of Investment Casting',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                            color: Colors.brown,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),*/
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Wrap(
                  spacing: 20,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                  /*  ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image.asset("assets/product_investment_cast.png")),*/
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset("assets/product_sand_cast.png")),
                   /* ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image.asset("assets/product_shell_mold_cast.png")),*/
                  ],
                ),
              )),

          // Features Section
          /*Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Our Features',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Icon(Icons.star, size: 48, color: Colors.blue[400]),
                            const SizedBox(height: 10),
                            Text(
                              'Feature ${index + 1}',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Brief description about this feature goes here.',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),*/

          /*const SizedBox(height: 30),*/

          // Testimonials Section
          /* Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blue[50],
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                const Text(
                  'What Our Users Say',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 4,
                          child: Container(
                            width: 300,
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.blue[200],
                                      child: Text(
                                        'U${index + 1}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      'User ${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'This is an amazing platform! I loved using it for my work and personal needs.',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),*/

          const SizedBox(height: 30),

          // Footer Section
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.blueGrey[900],
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  /*© 2024*/
                  'Shiva Sand Cast',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Survey no 64, Plot no 275, Shyam industrial park - 2,\nBhavda road, Bakrol Bujrang, Ahmedabad 382430',
                      softWrap: true,
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
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                   /* ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image.asset("assets/product_investment_cast.png")),*/
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset("assets/product_sand_cast.png")),
                  /*  ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image.asset("assets/product_shell_mold_cast.png")),*/
                  ],
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Mission',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'We aim to provide exceptional services and products to empower our customers.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            'We started with a vision to bring innovation and quality to the forefront. Our journey is one of hard work, dedication, and commitment to excellence.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Image.asset(
                      "assets/logo.jpeg",
                      width: MediaQuery.of(context).size.width / 3.0,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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

          const SizedBox(height: 20),
          // Form Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.0,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLength: 70,
                          onSaved: (value) => name = value ?? '',
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your name'
                              : null,
                          decoration: InputDecoration(
                            labelText: 'Your Name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLength: 64,
                          onSaved: (value) => email = value ?? '',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
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
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLines: 4,
                          onSaved: (value) => message = value ?? '',
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your message'
                              : null,
                          maxLength: 500,
                          decoration: InputDecoration(
                            labelText: 'Your Message',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            //await _launchEmail(email);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 12),
                          ),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: "shivasandcast@gmail.com",
      query:
      'subject=ProductEnquiry&body=How can I help you?', // Add subject and body (optional)
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}
