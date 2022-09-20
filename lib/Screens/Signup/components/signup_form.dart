// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:fpi_question_bank/auth_service.dart';
import 'package:fpi_question_bank/helper_function.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../../homepage.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController matricComtroller = TextEditingController();
  String email = '';
  String password = '';
  String username = '';
  String matric = '';
  bool _isLoading = false;
  AuthServices auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: kPrimaryColor,
            ),
          )
        : Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: TextFormField(
                    controller: matricComtroller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    cursorColor: kPrimaryColor,
                    onChanged: (val) {
                      setState(() {
                        matric = val;
                        print(matric);
                      });
                    },
                    validator: (value) {
                        if (value!.length == 12) {
                          return null;
                        } else {
                          return "Invalid matric number";
                        }
                      },
                    decoration: InputDecoration(
                      hintText: "Matric number",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: TextFormField(
                    controller: usernameController,
                    textInputAction: TextInputAction.done,
                    cursorColor: kPrimaryColor,
                    onChanged: (val) {
                      setState(() {
                        username = val;
                        print(username);
                      });
                    },
                    validator: (value) {
                      if (value != null) {
                        return null;
                      } else {
                        return "Field cannot be empty";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Full name",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.person),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
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
                      hintText: "Your password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Icon(Icons.lock),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: defaultPadding / 2),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        _isLoading = true;
                      });
                      await auth
                          .registerUser(username, password, email, matric)
                          .then((value) async {
                        if (value == true) {
                          // saving user data to shared preferences
                          await HelperFunction.saveUserLoggedInStatus(true);
                          await HelperFunction.saveUserEmailKey(email);
                          await HelperFunction.saveUserMatricKey(matric);
                          await HelperFunction.saveUsername(username);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else {
                          showSnackBar(context, Colors.red, value);
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      });
                    }
                  },
                  child: Text("Sign Up".toUpperCase()),
                ),
                const SizedBox(height: defaultPadding),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
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

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
      backgroundColor: color,
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
        textColor: Colors.white,
      ),
    ),
  );
}
