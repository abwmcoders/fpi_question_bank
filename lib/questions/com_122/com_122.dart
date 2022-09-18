// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../bph_1/bph.dart';

class Com122 extends StatelessWidget {
  const Com122({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Introduction to java',
      img1: 'assets/images/int1.png',
      img2: 'assets/images/int2.png',
      img3: 'assets/images/int3.png',
      img4: 'assets/images/int4.png',
isFour: true,
isThree: true,
      //! to add image 4
    );
  }
}