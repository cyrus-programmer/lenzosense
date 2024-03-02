import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool check = false;
  String value = "0.678";
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5),() {
      setState(() {
        check = true;
      });
    });
    generateRandomNumber();


    super.initState();
  }

  void generateRandomNumber() {
    final _random = Random();
    final randomNumber = _random.nextDouble();
    setState(() {
      value = randomNumber.toStringAsFixed(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/splash.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              const SizedBox(height: 50),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20,top: 20),
                    child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),
                  ),
                ),
              ),

              const SizedBox(height: 100),
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/logo.png",width: size.width/2)),
              Container(
                width: 277,
                height: 349,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: HexColor("#D9D9D9").withOpacity(0.63),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  children: [
                    Text(
                      "Results",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: HexColor("#FFFFFF"),
                          fontSize: 14,

                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          decorationColor: HexColor("#FFFFFF")
                      ),
                    ),
                    const SizedBox(height: 80),
                    !check? LoadingAnimationWidget.newtonCradle(
                      color: Colors.white.withOpacity(0.7),
                      size: 90,
                    ) : Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Probability",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: HexColor("#FFFFFF"),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  value,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: HexColor("#000000").withOpacity(0.8),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "Disease",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: HexColor("#FFFFFF"),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "CVD",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: HexColor("#000000").withOpacity(0.8),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            Text(
                              "Disease Status",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: HexColor("#FFFFFF"),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              double.parse(value) > 0.5 ? "Positive" : "Negative",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: HexColor("#000000").withOpacity(0.8),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],

                        )
                      ],
                    ),
                  ],
                ),
              ),


            ],
          )
      ),
    );
  }
}
