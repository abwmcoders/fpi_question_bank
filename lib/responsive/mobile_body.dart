// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fpi_question_bank/questions/bph_1/bph.dart';
import 'package:fpi_question_bank/questions/com124/com_124.dart';
import 'package:fpi_question_bank/questions/com_112/com_112.dart';
import 'package:fpi_question_bank/questions/com_113/com113.dart';
import 'package:fpi_question_bank/questions/com_123/com_123.dart';
import 'package:fpi_question_bank/questions/com_126/com_126.dart';
import 'package:fpi_question_bank/questions/com_a2/com_a2.dart';
import 'package:fpi_question_bank/questions/gns_101/gns_101.dart';
import 'package:fpi_question_bank/questions/mth_111/mth_11.dart';
import 'package:fpi_question_bank/questions/sta_112/sta_112.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff218f1f),
        elevation: 0,
        // leading: Padding(
        //   padding: const EdgeInsets.all(5.0),
        //   child: GestureDetector(
        //                     onTap: () {
        //                       //Navigator.pop(context);
        //                     },
        //                     child: IconLimiter(
        //                       applyColor: true,
        //                       height: 20,
        //                       width: 20,
        //                       image: 'assets/icons/user.png',
        //                     ),
        //                   ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                //Navigator.pop(context);
              },
              child: IconLimiter(
                applyColor: true,
                height: 20,
                width: 20,
                image: 'assets/icons/logout.png',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Color(0xff218f1f)),
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Computer Science Past\nQuestions',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome to our past questions site .',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.86,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.9),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top:10, left: 30, right: 30),
                    padding: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30,
                      children: [
                        HomeMenuCard(
                          title: 'COM 126',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Com126()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'COM 123',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Com123()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'BPH 121',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Bph()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'GNS 101',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Gns101()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'COM 112',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Com112()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'MTH 111',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Mth111()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'COM 113',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Com113()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'COM 123',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Coma2()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'COM 124',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Com124()));
                          },
                        ),
                        HomeMenuCard(
                          title: 'STA 112',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sta112()));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}

class HomeMenuCard extends StatelessWidget {
  const HomeMenuCard({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // height: screenAwareSize(250, context),
        //width: screenAwareSize(250, context),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: .5,
              blurRadius: .5,
              offset: Offset(0, 0.5), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconLimiter(
              image: 'assets/icons/academic.png',
              height: 50,
              width: 50,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class IconLimiter extends StatelessWidget {
  const IconLimiter({
    Key? key,
    required this.image,
    required this.height,
    required this.width,
    this.applyColor = false,
    this.color,
  }) : super(key: key);
  final String image;
  final double height;
  final double width;
  final bool applyColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: 60,
        child: Image.asset(
          image,
          fit: BoxFit.contain,
          color: applyColor ? Colors.white : color,
        ));
  }
}
