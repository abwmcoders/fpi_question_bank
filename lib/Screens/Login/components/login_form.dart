// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fpi_question_bank/auth_service.dart';
import 'package:fpi_question_bank/database_service.dart';
import 'package:fpi_question_bank/helper_function.dart';
import 'package:fpi_question_bank/homepage.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/components/signup_form.dart';
import '../../Signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
  bool _isLoading = false;
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            onChanged: (val) {
              setState(() {
                email = val;
                print(email);
              });
            },
            validator: (value) {
              return RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!)
                  ? null
                  : "Please enter a valid email address";
            },
            decoration: InputDecoration(
              hintText: "Email address",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.cabin),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              onChanged: (val) {
                setState(() {
                  password = val;
                  print(password);
                });
              },
              validator: (value) {
                if (value!.length < 8) {
                  return "Password most not be less than 8 characters";
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: "Your Password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    _isLoading = true;
                  });
                  await auth.loginUser(email, password).then((value) async {
                    print(value);
                    if (value == true) {
                      QuerySnapshot snapshot = await DatabaseService(
                              FirebaseAuth.instance.currentUser!.uid)
                          .gettingUserData(email);
                      // saving the value to our sf
                      await HelperFunction.saveUserLoggedInStatus(true);
                      await HelperFunction.saveUserEmailKey(email);
                      await HelperFunction.saveUsername(
                          snapshot.docs[0]['fullName']);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      showSnackBar(context, Colors.red, value);
                      setState(() {
                        _isLoading = false;
                      });
                    }
                  });
                }
              },
              child: Text(
                "Login".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
