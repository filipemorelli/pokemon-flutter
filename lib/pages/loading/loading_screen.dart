import 'package:flutter/material.dart';
import 'package:pokemon_flutter/styles/styles.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    rotationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    rotationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading..."),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          // color: Colors.cyan,
          child: RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
            child: Center(
              child: Image.asset(
                "assets/image/logo_transparent.png",
                width: 96,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
