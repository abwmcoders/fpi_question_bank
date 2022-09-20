// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'mobile_body.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyMobileBody();
  }
}
