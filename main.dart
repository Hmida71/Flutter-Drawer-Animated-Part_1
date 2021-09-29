// ! Code Created By DZ-TM071 Free Open Source !
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SliderAnimated(),
      home: DrawerAnimated(),
    );
  }
}

class DrawerAnimated extends StatefulWidget {
  const DrawerAnimated({Key? key}) : super(key: key);

  @override
  _DrawerAnimatedState createState() => _DrawerAnimatedState();
}

class _DrawerAnimatedState extends State<DrawerAnimated> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // ! Here Color Of Page Drawer ! 
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.purpleAccent, Colors.deepPurpleAccent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),

          // ! simple navigation menu !
          SafeArea(
              child: Container(
            width: 200,
            // color: Colors.amberAccent,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircleAvatar(
                        radius: 45,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Hmida Dev's"),
                      ),
                    ],
                  ),
                ),
                const ListTile(
                  title: Text("Home"),
                  leading: Icon(Icons.home),
                ),
                const ListTile(
                  title: Text("Settings"),
                  leading: Icon(Icons.settings),
                ),
                const ListTile(
                  title: Text("About"),
                  leading: Icon(Icons.help),
                ),
                const ListTile(
                  title: Text("Exit"),
                  leading: Icon(Icons.exit_to_app),
                ),
              ],
            ),
          )),

          // ! : MainScreen 
          TweenAnimationBuilder(
              // ? Here Change Animation
              curve: Curves.easeInOut ,
              tween: Tween<double>(begin: 0, end: value),
              // ? and here change 
              duration: const Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return (
                  Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: 
                  // !Scafold For MainScreen Here
                  Scaffold(
                    appBar: AppBar(),
                    body: Center(
                      child: Column(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                value == 0 ? value = 1 : value = 0;
                              });
                            },
                            child: const Text("Open"),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
              }),

          //! Gesture For Slide
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }
}

