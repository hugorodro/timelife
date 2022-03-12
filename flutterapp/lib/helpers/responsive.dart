import 'package:flutter/material.dart';

int largeSize = 1366;
int mediumSize = 768;
int smallSize = 360;
int customSize = 1100;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  final Widget customScreen;

  const ResponsiveWidget({ Key? key,required this.largeScreen, required this.mediumScreen, required this.smallScreen, required this.customScreen }) : super(key: key);

  static bool isSmall(BuildContext context) =>
  MediaQuery.of(context).size.width < smallSize;

  static bool isMedium(BuildContext context) =>
  MediaQuery.of(context).size.width >= mediumSize &&
  MediaQuery.of(context).size.width < largeSize;

  static bool isLarge(BuildContext context) =>
  MediaQuery.of(context).size.width >= largeSize;

  static bool isCustom(BuildContext context) =>
  MediaQuery.of(context).size.width >= mediumSize &&
  MediaQuery.of(context).size.width <= customSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if(_width >= largeSize) {
        return largeScreen;
      } else if(_width < largeSize && _width >= mediumSize) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    },
      
    );
  }
}