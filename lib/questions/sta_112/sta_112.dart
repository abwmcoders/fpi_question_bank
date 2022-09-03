// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../bph_1/bph.dart';

class Sta112 extends StatelessWidget {
  const Sta112({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Elementary Probability Theory',
      img1: 'assets/images/sta1.png',
      img2: 'assets/images/sta2.png',
      img3: 'assets/images/sta3.png',
      isThree: true,
    );
  }
}