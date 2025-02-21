import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const TopAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildMainCard(size),
                    _buildButtonGrid(buttonSize, spacing, context),
                  ],
                ),
              ),
            ),
            const BottomAppBar(),
          ],
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
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(size.height * 0.02),
        ),
      ),
    );
  }

  Widget _buildButtonGrid(double buttonSize, double spacing, BuildContext context) {
    const buttonData = [
      {'icon': 'flutter.svg', 'label': 'Flutter'},
      {'icon': 'flutter.svg', 'label': 'Flutter'},
      {'icon': 'flutter.svg', 'label': 'Flutter'},
      {'icon': 'flutter.svg', 'label': 'Flutter'},
      {'icon': 'flutter.svg', 'label': 'Flutter'},
      {'icon': 'flutter.svg', 'label': 'Flutter'},
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
        backgroundColor: Colors.blue,
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
          color: Colors.lightBlueAccent,
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