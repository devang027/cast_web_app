import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10),
                Expanded(
                  child: Text('94287 07047 I 94290 66811',
                      softWrap: true, style: TextStyle(fontSize: 22)),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10),
                Expanded(
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
        children: const [
          HomeTabView(),
          ProductsTabView(),
          AboutUsTabView(),
          EnquiryTabView(),
        ],
      ),
    );
  }
}

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero Section
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg_home.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HME',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    'HARIOM METAL CAST',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Container(
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
                  )
                ],
              ),
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
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image.asset("assets/product_investment_cast.png")),
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset("assets/product_sand_cast.png")),
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image.asset("assets/product_shell_mold_cast.png")),
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
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '© 2024 Shiva Sand Cast',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  'Unit-1 L-146, G.I.D.C. Estate, Nr. Water Tank, Odhav, Ahmedabad - 382 415',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                Text(
                  'Unit-2 Plot no: 412&435, Gopalcharan Industrial Hub., Village: Bakrol-Bujrang,Taluka: Daskroi, District: Ahmedabad, Gujarat, India - 382430.',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                SizedBox(height: 10),
                Wrap(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductsTabView extends StatelessWidget {
  const ProductsTabView({super.key});

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
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image.asset("assets/product_investment_cast.png")),
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.asset("assets/product_sand_cast.png")),
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child:
                            Image.asset("assets/product_shell_mold_cast.png")),
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child:
                      const Text('Contact Us', style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 10),
                const Wrap(
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
                      'Support',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUsTabView extends StatelessWidget {
  const AboutUsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Expanded(
          child: Padding(
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
                const Text(
                  'We started with a vision to bring innovation and quality to the forefront. Our journey is one of hard work, dedication, and commitment to excellence.',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),

        // Footer Section
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          color: Colors.blueGrey[900],
          child: Column(
            children: [
              const Text(
                'Want to know more?',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('Contact Us', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 10),
              const Wrap(
                spacing: 16,
                children: [
                  Text(
                    'Careers',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    'Press',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    'Support',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EnquiryTabView extends StatelessWidget {
  const EnquiryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 3.0,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Your Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: 'Your Message',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Footer Section
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          color: Colors.blueGrey[900],
          child: Column(
            children: [
              const Text(
                'Need immediate help?',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent[700],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child:
                    const Text('Chat with Us', style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 10),
              const Wrap(
                spacing: 16,
                children: [
                  Text(
                    'FAQ',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    'Support Center',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  Text(
                    'Contact',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*
*
* Shiva Sand Cast
Address
Survey no 64, Plot no 275
Shyam industrial park - 2
Bhavda road
Bakrol Bujrang
Ahmedabad
382430
 Email id
shivasandcast@gmail.com
* */
