import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final buttonSize = size.height * 0.10;
    final spacing = size.width * 0.1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x6667ffff),
              Color(0x32772cef),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const TopAppBar(),
              SizedBox(
                height: size.height * 0.08,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Block0(),
                      _buildButtonGrid(buttonSize, spacing, context),
                    ],
                  ),
                ),
              ),
              const BottomAppBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainCard(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0x6667ffff),
          borderRadius: BorderRadius.circular(size.height * 0.02),
        ),
      ),
    );
  }

  Widget _buildButtonGrid(double buttonSize, double spacing, BuildContext context) {
    const buttonData = [
      {'icon': 'flutter.svg', 'label': 'CBT-AI'},
      {'icon': 'flutter.svg', 'label': 'CBT-Counsellor'},
      {'icon': 'flutter.svg', 'label': ' Emotional\nAssessment'},
      {'icon': 'flutter.svg', 'label': 'Mindfullness'},
      {'icon': 'flutter.svg', 'label': 'Support near\n         me'},
      {'icon': 'flutter.svg', 'label': '...'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(vertical: spacing),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: buttonData.map((data) {
          return CustomIconButton(
            iconPath: 'assets/svg/raw/${data['icon']}',
            label: data['label']!,
            size: buttonSize,
            onPressed: () => print('${data['label']} pressed'),
          );
        }).toList(),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final double size;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.iconPath,
    required this.label,
    required this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size * 0.2),
          color: Theme.of(context).colorScheme.onTertiary,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, width: 27.5),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: size * 0.15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(Icons.menu, () => print('Menu pressed')),
          const Text(
            "EUNOIA",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          _buildIconButton(Icons.search, () => print('Search pressed')),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Color(0x50ffffff),
        padding: const EdgeInsets.all(18),
      ),
    );
  }
}

class BottomAppBar extends StatelessWidget {
  const BottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String,dynamic>> icons = [
      {'icon': Icons.home,'label':"Home"},
      {'icon': Icons.search,'label':"Search"},
      {'icon': Icons.add,'label':"Add"},
      {'icon': Icons.favorite,'label':"Favorite"},
      {'icon': Icons.person,'label':"Person"},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Color(0x50ffffff),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: icons.map<Widget>((iconz) {
            return IconButton(
              icon: Icon(iconz['icon'] as IconData),
              onPressed: () => print('${iconz['label']} pressed'),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class Block0 extends StatefulWidget {
  const Block0({super.key});

  @override
  State<Block0> createState() => _Block0State();
}

class _Block0State extends State<Block0> {
  @override
  Widget build(BuildContext context) {

    var standardHeight = MediaQuery.of(context).size.height;
    var standardWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: standardHeight * 0.28,
      child: ListView(
        children: [
          CarouselSlider(
            items:[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff6734d8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/Block 0 Images/A1.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff6734d8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/Block 0 Images/A2.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff6734d8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/Block 0 Images/A3.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff6734d8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/Block 0 Images/A4.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff6734d8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      "assets/Block 0 Images/A5.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              height: standardHeight * 0.28,
              viewportFraction: 1,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayAnimationDuration: const Duration(milliseconds: 300),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ]
      ),
    );
  }
}
