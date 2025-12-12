import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late AnimationController _text1Controller;
  late AnimationController _text2Controller;
  late AnimationController _text3Controller;

  late Animation<double> _fade1;
  late Animation<double> _fade2;
  late Animation<double> _fade3;

  @override
  void initState() {
    super.initState();

    // Animation Controllers
    _text1Controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _text2Controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _text3Controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));

    _fade1 = CurvedAnimation(parent: _text1Controller, curve: Curves.easeIn);
    _fade2 = CurvedAnimation(parent: _text2Controller, curve: Curves.easeIn);
    _fade3 = CurvedAnimation(parent: _text3Controller, curve: Curves.easeIn);

    startAnimation();
  }

  Future<void> startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));
    _text1Controller.forward();

    await Future.delayed(const Duration(milliseconds: 400));
    _text2Controller.forward();

    await Future.delayed(const Duration(milliseconds: 400));
    _text3Controller.forward();

    // Wait 1 second after animations finish
    await Future.delayed(const Duration(seconds: 1));

    // Navigate to home page
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void dispose() {
    _text1Controller.dispose();
    _text2Controller.dispose();
    _text3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Logo
            Image.asset(
              'assets/logo.png',
              width: 150,
            ),
            const SizedBox(height: 30),

            FadeTransition(
              opacity: _fade1,
              child: const Text(
                "Welcome to Niya Sportswear",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 10),

            FadeTransition(
              opacity: _fade2,
              child: const Text(
                "Quality Apparel for Everyone",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),

            const SizedBox(height: 10),

            FadeTransition(
              opacity: _fade3,
              child: const Text(
                "Made with Passion in Ethiopia 🇪🇹",
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
