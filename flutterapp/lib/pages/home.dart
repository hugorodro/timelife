import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/responsive.dart';
import 'package:flutterapp/widgets/large_screen.dart';
import 'package:flutterapp/widgets/small_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: const ResponsiveWidget(largeScreen: LargeScreen(), mediumScreen: LargeScreen(), smallScreen: SmallScreen()),
    );
  }
}