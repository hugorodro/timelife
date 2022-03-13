import 'package:flutter/material.dart';

int largeSize = 1366;
int mediumSize = 768;
int smallSize = 360;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;

  const ResponsiveWidget({ Key? key,required this.largeScreen, required this.mediumScreen, required this.smallScreen }) : super(key: key);

  // static bool isSmall(BuildContext context) =>
  // MediaQuery.of(context).size.width < smallSize;

  // static bool isMedium(BuildContext context) =>
  // MediaQuery.of(context).size.width >= mediumSize &&
  // MediaQuery.of(context).size.width < largeSize;

  // static bool isLarge(BuildContext context) =>
  // MediaQuery.of(context).size.width >= largeSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double width = constraints.maxWidth;
      if(width >= largeSize) {
        return largeScreen;
      } else if(width < largeSize && width >= mediumSize) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    },
      
    );
  }
}