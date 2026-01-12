import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  const CustomText({super.key});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      tween: Tween<double>(begin: 0, end: 1),
      builder: (BuildContext context, double val, child) {
        return Opacity(
          opacity: val,
          child: Container(
            margin: EdgeInsetsGeometry.only(left: val * 20),
            child: child,
          ),
        );
      },
      child: Text("Practise Animation", style: TextStyle(fontSize: 20)),
    );
  }
}
