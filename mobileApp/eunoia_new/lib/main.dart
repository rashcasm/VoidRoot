import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 50,
                          width: 50,
                          child: Icon(Icons.menu),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    ],
                  ),
                ),
              ),
            ),
            bottom_appbar(),
          ],
        ),
      ),
    );
  }

  Align bottom_appbar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: null, child: Icon(Icons.home, color: Colors.black)),
              IconButton(
                onPressed: () {
                  print("search button pressed");
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  print("add button pressed");
                },
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: () {
                  print("favorite button pressed");
                },
                icon: Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  print("person button pressed");
                },
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
