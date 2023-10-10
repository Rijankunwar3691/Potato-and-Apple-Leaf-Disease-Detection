import 'package:cropssafe/components/authentication_button.dart';
import 'package:cropssafe/components/curve.dart';
import 'package:cropssafe/components/google_button.dart';
import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/inner_screens/forgot_password.dart';
import 'package:cropssafe/inner_screens/loading_manager.dart';
import 'package:cropssafe/screens/landingpage.dart';
import 'package:cropssafe/screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/btm_bar.dart';
import '../consts/firebase_consts.dart';
import '../consts/global_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;
  var email = '';
  var password = '';
  final _emailTextController = TextEditingController();
  final _passTextController = TextEditingController();
  final _passFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passTextController.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  bool _obscureText = true;

  bool _isLoading = false;

  void _submitFormOnLogin() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await authInstance.signInWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passTextController.text.trim());
        Fluttertoast.showToast(
          msg: "Successfully logged in ",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade600,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => BottomBarScreen()));
        print('Succefully registered');
      } on FirebaseException catch (error) {
        GlobalMethods.errorDialog(
            subtitle: '${error.message}', context: context);
        setState(() {
          _isLoading = false;
        });
      } catch (error) {
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
        setState(() {
          _isLoading = false;
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kSpiritedGreen,
      child: LoadingManager(
        isLoading: _isLoading,
        child: Stack(
          alignment: Alignment.bottomRight,
          fit: StackFit.expand,
          children: [
            // First Child in the stack

            ClipPath(
              clipper: ImageClipper(),
              child: Image.asset(
                'images/leaves.jpg',
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth,
              ),
            ),

            Positioned(
              top: 30.0,
              left: 20.0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) {
                        return Landing_page();
                      },
                    ));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: kDarkGreenColor,
                    size: 24.0,
                  ),
                ),
              ),
            ),

            // Second Child in the stack
            Positioned(
              height: MediaQuery.of(context).size.height * 0.67,
              width: MediaQuery.of(context).size.width,
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Container(
                    color: kSpiritedGreen,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.67,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // First Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome Back',
                              style: GoogleFonts.poppins(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                                color: kDarkGreenColor,
                              ),
                            ),
                            Text(
                              'Login to your account',
                              style: GoogleFonts.poppins(
                                color: kGreyColor,
                                fontSize: 15.0,
                              ),
                            )
                          ],
                        ),

                        // Second Column
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, bottom: 15.0),
                                child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  onEditingComplete: () =>
                                      FocusScope.of(context)
                                          .requestFocus(_passFocusNode),
                                  cursorColor: kDarkGreenColor,
                                  controller: _emailTextController,
                                  onChanged: (value) => email = value,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains(RegExp(r'[0-9]'))) {
                                      return 'Please enter a valid email address';
                                    } else {
                                      return null;
                                    }
                                  },
                                  style: GoogleFonts.poppins(
                                    color: kDarkGreenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(18.0),
                                    filled: true,
                                    fillColor: kGinColor,
                                    prefixIcon: Icon(
                                      Icons.person,
                                      size: 24.0,
                                      color: kDarkGreenColor,
                                    ),
                                    hintText: 'Email',
                                    hintStyle: GoogleFonts.poppins(
                                      color: kDarkGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: kGinColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: kDarkGreenColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, bottom: 15.0),
                                child: TextFormField(
                                  focusNode: _passFocusNode,
                                  obscureText: _obscureText,
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: _passTextController,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        value.length < 7 ||
                                        !value.contains(RegExp(r'[0-9]')) ||
                                        !value.contains(RegExp(r'[A-Z]'))) {
                                      return "Please enter a valid password";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onEditingComplete: () =>
                                      {_submitFormOnLogin()},
                                  style: GoogleFonts.poppins(
                                    color: kDarkGreenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.0,
                                  ),
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(18.0),
                                    filled: true,
                                    fillColor: kGinColor,
                                    prefixIcon: Icon(
                                      Icons.password,
                                      size: 24.0,
                                      color: kDarkGreenColor,
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(
                                        _obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: kDarkGreenColor,
                                      ),
                                    ),
                                    hintText: 'Password',
                                    hintStyle: GoogleFonts.poppins(
                                      color: kDarkGreenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.0,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(color: kGinColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide:
                                          BorderSide(color: kDarkGreenColor),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          fillColor: MaterialStateProperty.all(
                                              kDarkGreenColor),
                                          value: rememberMe,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberMe = value!;
                                            });
                                          },
                                        ),
                                        Text(
                                          'Remember Me',
                                          style: TextStyle(
                                            color: kGreyColor,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ForgetPasswordScreen()));
                                      },
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                kDarkGreenColor),
                                      ),
                                      child: const Text(
                                        'Forgot Password ?',
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Third Column
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 20.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AuthenticationButton(
                                  label: 'Log In',
                                  onPressed: () {
                                    _submitFormOnLogin();
                                  }),
                              const SizedBox(
                                height: 10,
                              ),
                              // GoogleButton(),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Don\'t have an account ?',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                kDarkGreenColor),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, SignupScreen.id);
                                      },
                                      child: const Text(
                                        'Sign up',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
