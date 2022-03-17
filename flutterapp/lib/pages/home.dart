import 'package:flutter/material.dart';
import 'package:flutterapp/helpers/responsive.dart';
import 'package:flutterapp/widgets/large_screen.dart';
import 'package:flutterapp/widgets/small_screen.dart';
import 'package:flutterapp/widgets/top_nav.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topNavigatorBar(context, key),
      drawer: const Drawer(),
      body: const ResponsiveWidget(largeScreen: LargeScreen(), mediumScreen: LargeScreen(), smallScreen: SmallScreen()),
    );
  }
}