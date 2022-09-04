// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../responsive/mobile_body.dart';

class Bph extends StatelessWidget {
  const Bph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Optics,Waves,Electricity and Magnetism/Physics 11',
      img1: 'assets/images/bp1.png',
      img2: 'assets/images/bp2.png',
      img3: '',
    );
  }
}

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({
    Key? key,
    required this.title,
    required this.img1,
    required this.img2,
    required this.img3,
    this.isThree = false,
  }) : super(key: key);

  final String title;
  final String img1, img2, img3;
  final bool isThree;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: IconLimiter(
              applyColor: false,
              height: 20,
              width: 20,
              image: 'assets/icons/back.png',
              color: Colors.green,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 230, 234, 230),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(img1), fit: BoxFit.contain)),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(img2), fit: BoxFit.contain)),
        ),
        isThree ? Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(img3), fit: BoxFit.contain)),
        ) : Container(),
      ],
        ),
      ),
    );
  }
}
