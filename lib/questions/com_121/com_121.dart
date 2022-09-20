// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../bph_1/bph.dart';

class Com121 extends StatelessWidget {
  const Com121({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Introduction to java',
      img1: 'assets/images/java1.png',
      img2: 'assets/images/java2.png',
      img3: 'assets/images/java3.png',
      img4: 'assets/images/java4.png',
      isFour: true,
      isThree: true,
    );
  }
}

class Com121Extra extends StatelessWidget {
  const Com121Extra({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Introduction to java',
      img1: 'assets/images/an java1.png',
      img2: 'assets/images/an java2.png',
      img3: 'assets/images/an java3.png',
      img4: '',
      isThree: true,
    );
  }
}