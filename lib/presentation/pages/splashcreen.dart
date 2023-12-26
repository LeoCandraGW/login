// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login/presentation/pages/bottomnavbar.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash';
  final String Username;
  const SplashScreen({super.key, required this.Username});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(
          context, BottomNavigationBarExample.routeName,
          arguments: widget.Username);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 150,
          alignment: Alignment.center,
          child: FlutterLogo(
            size: 200,
          ),
        ),
      ),
    );
  }
}
