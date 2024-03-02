
import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:lenzosense/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this)..repeat();


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 10),()=> Navigator.push(context, MaterialPageRoute(builder:  (context) =>  const HomePage())));

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/splash.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            SizedBox(height: size.height*0.08),
             Align(
                alignment: Alignment.center,
                child: Image.asset("assets/logo.png",width: size.width/2)),
          ],
        ),
      ),
    );
  }
}