// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpi_question_bank/Screens/Signup/components/signup_form.dart';
import 'package:fpi_question_bank/Screens/Welcome/welcome_screen.dart';
import 'package:fpi_question_bank/auth_service.dart';
import 'package:fpi_question_bank/helper_function.dart';
import 'package:fpi_question_bank/questions/bph_1/bph.dart';
import 'package:fpi_question_bank/questions/com124/com_124.dart';
import 'package:fpi_question_bank/questions/com_112/com_112.dart';
import 'package:fpi_question_bank/questions/com_113/com113.dart';
import 'package:fpi_question_bank/questions/com_121/com_121.dart';
import 'package:fpi_question_bank/questions/com_122/com_122.dart';
import 'package:fpi_question_bank/questions/com_123/com_123.dart';
import 'package:fpi_question_bank/questions/com_125/com_125.dart';
import 'package:fpi_question_bank/questions/com_126/com_126.dart';
import 'package:fpi_question_bank/questions/com_a2/com_a2.dart';
import 'package:fpi_question_bank/questions/gns_101/gns_101.dart';
import 'package:fpi_question_bank/questions/mth_111/mth_11.dart';
import 'package:fpi_question_bank/questions/sta_112/sta_112.dart';

import '../constants.dart';
import '../helper.dart';

class MyMobileBody extends StatefulWidget {
  MyMobileBody({Key? key}) : super(key: key);

  @override
  State<MyMobileBody> createState() => _MyMobileBodyState();
}

class _MyMobileBodyState extends State<MyMobileBody> {
  AuthServices auth = AuthServices();
  String username = '';
  String userEmail = '';
  String matric = '';
  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    await HelperFunction.getUserEmailFromSp().then((value) {
      setState(() {
        userEmail = value!;
      });
    });

    await HelperFunction.getUserNameFromSp().then((value) {
      setState(() {
        username = value!;
      });
    });

    await HelperFunction.getUserMatric().then((value) {
      setState(() {
        matric = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff218f1f),
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () async {
                  try {
                   showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Logout'),
                            content: Text('You are about to logout'),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    auth.loginUser;
                                    await HelperFunction.saveUserLoggedInStatus(
                                        false);
                                    await HelperFunction.saveUserEmailKey('');
                                    await HelperFunction.saveUserMatricKey('');
                                    await HelperFunction.saveUsername('');
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WelcomeScreen()));
                                  },
                                  icon: Icon(
                                    Icons.done,
                                    color: Colors.red,
                                  )),
                            ],
                          );
                        });
                  } catch (e) {
                    print(e);
                  }
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
                      margin: EdgeInsets.only(top: 10, left: 30, right: 30),
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
                              selectOptionTile(
                                context,
                                content: Column(
                                  children: [
                                    OptionsTextStyle(
                                      title: '2018/2019',
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Com126()));
                                      },
                                    ),
                                    Divider(
                                      thickness: 2,
                                    ),
                                    OptionsTextStyle(
                                      title: '2015/2016',
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Com126Extra2()));
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          HomeMenuCard(
                            title: 'COM 123',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2019/2020',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com123()));
                                        },
                                      ),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      OptionsTextStyle(
                                        title: '2017/2018',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Coma2()));
                                        },
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          HomeMenuCard(
                            title: 'COM 121',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2014/2015',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com121()));
                                        },
                                      ),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      OptionsTextStyle(
                                        title: '2018/2019',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com121Extra()));
                                        },
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          HomeMenuCard(
                            title: 'COM 125',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2019/2020',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com125()));
                                        },
                                      ),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      OptionsTextStyle(
                                        title: '2017/2018',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com125Extra()));
                                        },
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          HomeMenuCard(
                            title: 'COM 122',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2018/2019',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com122()));
                                        },
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          HomeMenuCard(
                            title: 'BPH 121',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2019/2020',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Bph()));
                                        },
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          HomeMenuCard(
                            title: 'GNS 101',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2014/2015',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Gns101()));
                                        },
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          HomeMenuCard(
                            title: 'COM 112',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2014/2015',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com112()));
                                        },
                                      ),
                                    ],
                                  ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Com112()));
                            },
                          ),
                          HomeMenuCard(
                            title: 'MTH 111',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2014/2015',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Mth111()));
                                        },
                                      ),
                                    ],
                                  ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Mth111()));
                            },
                          ),
                          HomeMenuCard(
                            title: 'COM 113',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2014/2015',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com113()));
                                        },
                                      ),
                                    ],
                                  ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Com113()));
                            },
                          ),
                          HomeMenuCard(
                            title: 'COM 124',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2017/2018',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com124()));
                                        },
                                      ),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      OptionsTextStyle(
                                        title: '2016/2017',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Com124Extra()));
                                        },
                                      ),
                                    ],
                                  ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Com124()));
                            },
                          ),
                          HomeMenuCard(
                            title: 'STA 112',
                            onTap: () {
                              selectOptionTile(context,
                                  content: Column(
                                    children: [
                                      OptionsTextStyle(
                                        title: '2017/2018',
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Sta112()));
                                        },
                                      ),
                                    ],
                                  ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Sta112()));
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
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  color: Colors.grey.shade700,
                  size: 150,
                ),
                UIHelper.verticalSPaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: UIHelper.kMediumFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      username,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: UIHelper.kMediumFont,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: UIHelper.kMediumFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      userEmail,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Matric number: ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: UIHelper.kMediumFont,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      matric,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSPaceSmall,
                Divider(
                  height: 2,
                ),
                ListTile(
                  onTap: () {
                    showSnackBar(context, kPrimaryColor, 'Coming soon');
                  },
                  selectedColor: kPrimaryColor,
                  leading: Icon(Icons.group),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  selected: true,
                  title: Text(
                    'Our Team',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: UIHelper.kMediumFont,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                     showSnackBar(context, kPrimaryColor, 'Coming soon');
                  },
                  leading: Icon(Icons.person),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: UIHelper.kMediumFont,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Logout'),
                            content: Text('You are about to logout'),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.green,
                                  )),
                              IconButton(
                                  onPressed: () async {
                                    auth.loginUser;
                                    await HelperFunction.saveUserLoggedInStatus(
                                        false);
                                    await HelperFunction.saveUserEmailKey('');
                                    await HelperFunction.saveUserMatricKey('');
                                    await HelperFunction.saveUsername('');
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WelcomeScreen()));
                                  },
                                  icon: Icon(
                                    Icons.done,
                                    color: Colors.red,
                                  )),
                            ],
                          );
                        });
                  },
                  leading: Icon(Icons.exit_to_app),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: UIHelper.kMediumFont,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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

Future<dynamic> selectOptionTile(BuildContext context,
    {required Widget content}) {
  return showModalBottomSheet(
    isDismissible: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: screenHeight(context),
        //color: CoolorsBank.whiteColor,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              width: screenWidth(context),
              decoration: BoxDecoration(
                color: CoolorsBank.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Select a year',
                    style: TextStyle(
                      fontSize: UIHelper.kMediumFont,
                      fontWeight: FontWeight.w400,
                      color: CoolorsBank.darkGrey,
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  UIHelper.verticalSPaceSmall,
                  content
                ],
              ),
            ),
            UIHelper.verticalSPaceSmall,
            Container(
              height: screenAwareSize(80, context),
              decoration: BoxDecoration(
                color: CoolorsBank.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: OptionsTextStyle(
                    title: 'Cancel', onTap: () => Navigator.pop(context)),
              ),
            ),
            // UIHelper.verticalSpaceMedium
          ],
        ),
      );
    },
  );
}

class OptionsTextStyle extends StatelessWidget {
  const OptionsTextStyle({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          fontSize: UIHelper.kLargeFont / 2,
          fontWeight: FontWeight.bold,
          color: CoolorsBank.blueColor,
        ),
      ),
    );
  }
}
