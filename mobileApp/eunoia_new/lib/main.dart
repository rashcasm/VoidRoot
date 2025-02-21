import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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

    var standardHeight = MediaQuery.of(context).size.height;
    var standardWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            TopBar(),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(standardHeight * 0.02),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Midbuttons(standardHeight, context, standardWidth),
                ],
              ),
            ),
            bottom_appbar(),
          ],
        ),
      ),
    );
  }

  Align Midbuttons(double standardHeight, BuildContext context, double standardWidth) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: standardHeight * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      print("Button1");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                    ),
                    child: Container(
                      height: standardHeight * 0.10,
                      width: standardHeight * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(standardHeight * 0.02),
                        ),
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
                          SizedBox(height: standardHeight * 0.01),
                          SvgPicture.asset(
                            'assets/svg/raw/flutter.svg',
                            width: 27.5,
                          ),
                          SizedBox(height: standardHeight * 0.01),
                          Text(
                            'Flutter',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: standardHeight * 0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: standardWidth * 0.1),
                  ElevatedButton(
                    onPressed: (){
                      print("Button1");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                    ),
                    child: Container(
                      height: standardHeight * 0.10,
                      width: standardHeight * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(standardHeight * 0.02),
                        ),
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
                          SizedBox(height: standardHeight * 0.01),
                          SvgPicture.asset(
                            'assets/svg/raw/flutter.svg',
                            width: 27.5,
                          ),
                          SizedBox(height: standardHeight * 0.01),
                          Text(
                            'Flutter',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: standardHeight * 0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: standardWidth * 0.1),
                  ElevatedButton(
                    onPressed: (){
                      print("Button1");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                    ),
                    child: Container(
                      height: standardHeight * 0.10,
                      width: standardHeight * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(standardHeight * 0.02),
                        ),
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
                          SizedBox(height: standardHeight * 0.01),
                          SvgPicture.asset(
                            'assets/svg/raw/flutter.svg',
                            width: 27.5,
                          ),
                          SizedBox(height: standardHeight * 0.01),
                          Text(
                            'Flutter',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: standardHeight * 0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: standardWidth * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      print("Button1");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                    ),
                    child: Container(
                      height: standardHeight * 0.10,
                      width: standardHeight * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(standardHeight * 0.02),
                        ),
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
                          SizedBox(height: standardHeight * 0.01),
                          SvgPicture.asset(
                            'assets/svg/raw/flutter.svg',
                            width: 27.5,
                          ),
                          SizedBox(height: standardHeight * 0.01),
                          Text(
                            'Flutter',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: standardHeight * 0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: standardWidth * 0.1),
                  ElevatedButton(
                    onPressed: (){
                      print("Button1");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                    ),
                    child: Container(
                      height: standardHeight * 0.10,
                      width: standardHeight * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(standardHeight * 0.02),
                        ),
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
                          SizedBox(height: standardHeight * 0.01),
                          SvgPicture.asset(
                            'assets/svg/raw/flutter.svg',
                            width: 27.5,
                          ),
                          SizedBox(height: standardHeight * 0.01),
                          Text(
                            'Flutter',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: standardHeight * 0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: standardWidth * 0.1),
                  ElevatedButton(
                    onPressed: (){
                      print("Button1");
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      padding: EdgeInsets.all(0),
                    ),
                    child: Container(
                      height: standardHeight * 0.10,
                      width: standardHeight * 0.10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(standardHeight * 0.02),
                        ),
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
                          SizedBox(height: standardHeight * 0.01),
                          SvgPicture.asset(
                            'assets/svg/raw/flutter.svg',
                            width: 27.5,
                          ),
                          SizedBox(height: standardHeight * 0.01),
                          Text(
                            'Flutter',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: standardHeight * 0.015,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      )
    );
  }
  Align TopBar() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (){
                print("menu button pressed");
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.transparent,
                overlayColor: Colors.transparent,
                shape: CircleBorder(),
                padding: EdgeInsets.all(18),
              ),
              child: Icon(
                Icons.menu,
                color: Colors.black
              ),
            ),
            Text(
              "EUNOIA",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: (){
                print("search button pressed");
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.blue,
                foregroundColor: Colors.transparent,
                overlayColor: Colors.transparent,
                shape: CircleBorder(),
                padding: EdgeInsets.all(18),
              ),
              child: Icon(
                  Icons.search,
                  color: Colors.black
              ),
            ),
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
              ElevatedButton(
                onPressed: (){
                  print("home button pressed");
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                ),
                child: Icon(
                  Icons.home,
                  color: Colors.black
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  print("search button pressed");
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                ),
                child: Icon(
                    Icons.search,
                    color: Colors.black
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  print("add button pressed");
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                ),
                child: Icon(
                    Icons.add,
                    color: Colors.black
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  print("favorite button pressed");
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                ),
                child: Icon(
                    Icons.favorite,
                    color: Colors.black
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  print("person button pressed");
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                ),
                child: Icon(
                    Icons.person,
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
