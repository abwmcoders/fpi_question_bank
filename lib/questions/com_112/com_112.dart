// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../bph_1/bph.dart';

class Com112 extends StatelessWidget {
  const Com112({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Introduction To Digital Electronic',
      img1: 'assets/images/digital1.png',
      img2: 'assets/images/digital2.png',
      img3: 'assets/images/digital3.png',
    );
  }
}