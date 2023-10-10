import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropssafe/components/authentication_button.dart';
import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/inner_screens/loading_manager.dart';
import 'package:cropssafe/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/btm_bar.dart';
import '../consts/firebase_consts.dart';
import '../consts/global_methods.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static String id = 'SignupScreen';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();

  final _emailTextController = TextEditingController();

  final _passTextController = TextEditingController();

  final _passFocusNode = FocusNode();
  final _addressFousNode = FocusNode();
  final _emailFocusNode = FocusNode();

  bool _obscureText = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _addressFousNode.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();

    super.dispose();
  }

  bool _isLoading = false;

  void _submitFormOnRegister() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      try {
        await authInstance.createUserWithEmailAndPassword(
            email: _emailTextController.text.toLowerCase().trim(),
            password: _passTextController.text.trim());
        Fluttertoast.showToast(
          msg: "Succefully registered",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey.shade600,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        final User? user = authInstance.currentUser;
        final uid = user!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'id': uid,
          'name': _fullNameController.text,
          'email': _emailTextController.text.toLowerCase(),
          'password': _passTextController.text.toLowerCase()
        });

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BottomBarScreen()));
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
      child: LoadingManager(
        isLoading: _isLoading,
        child: Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  color: kSpiritedGreen,
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Register',
                              style: GoogleFonts.poppins(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                                color: kDarkGreenColor,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'Create a new account',
                              style: GoogleFonts.poppins(
                                color: kGreyColor,
                                fontSize: 16.0,
                              ),
                            ),
                            const SizedBox(height: 40.0),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 15.0),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(_emailFocusNode),
                                keyboardType: TextInputType.name,
                                cursorColor: kDarkGreenColor,
                                controller: _fullNameController,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !value.contains(RegExp(r'[A-Z]')) ||
                                      value.contains(RegExp(r'[0-9]')) ||
                                      !value.contains(RegExp(r'[a-z]')) ||
                                      value.contains(
                                          RegExp(r'[!@#$%^&*()_-]'))) {
                                    return "This Field is missing";
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
                                  hintText: 'Full Name',
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
                                focusNode: _emailFocusNode,
                                textInputAction: TextInputAction.next,
                                onEditingComplete: () => FocusScope.of(context)
                                    .requestFocus(_passFocusNode),
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextController,
                                validator: (value) {
                                  if (value!.isEmpty ||
                                      !value.contains("@") ||
                                      !value.contains(RegExp(r'[0-9]'))) {
                                    return "Please enter a valid Email adress";
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
                                    Icons.email,
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
                                    {_submitFormOnRegister()},
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
                            const SizedBox(height: 15.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'By signing you agree to our ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: kDarkGreenColor,
                                  ),
                                ),
                                Text(
                                  ' Terms of use',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: kGreyColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'and ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: kDarkGreenColor,
                                  ),
                                ),
                                Text(
                                  ' privacy notice',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    color: kGreyColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: AuthenticationButton(
                          label: 'Sign Up',
                          onPressed: () {
                            _submitFormOnRegister();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account ?',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.w600),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(kDarkGreenColor),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30.0,
              left: 20.0,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                radius: 20.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: kDarkGreenColor,
                    size: 24.0,
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
