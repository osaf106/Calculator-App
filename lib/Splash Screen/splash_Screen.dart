import 'dart:async';

import 'package:calculator/Dashboard/Calculator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> CalculatorScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Osaf Ahmed",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w700
                ),
              ),
              Text("Calculator",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                letterSpacing: 5,
                fontWeight: FontWeight.w700
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
