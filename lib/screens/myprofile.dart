import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/consts/firebase_consts.dart';
import 'package:cropssafe/inner_screens/privacy.dart';
import 'package:cropssafe/inner_screens/terms_and_conditions.dart';
import 'package:cropssafe/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/global_methods.dart';
import '../inner_screens/text_widget.dart';

class Myprofile extends StatefulWidget {
  @override
  State<Myprofile> createState() => _MyprofileState();
}

class _MyprofileState extends State<Myprofile> {
  Widget listTile(
      {IconData? icon, String? title, required Function() onPressed}) {
    return Column(
      children: [
        Divider(height: 0.5),
        ListTile(
          leading: Icon(icon),
          title: Text(title!),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            onPressed();
          },
        )
      ],
    );
  }

  String? _email;
  String? _name;
  bool _isLoading = false;
  final User? user = authInstance.currentUser;

  @override
  void initState() {
    getuserData();
    super.initState();
  }

  Future<void> getuserData() async {
    setState(() {
      _isLoading = true;
    });
    if (user == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    try {
      String _uid = user!.uid;

      final DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(_uid).get();
      if (userDoc == null) {
        return;
      } else {
        _email = userDoc.get('email');
        _name = userDoc.get('name');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      GlobalMethods.errorDialog(subtitle: '$error', context: context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSpiritedGreen,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: kMain,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Crops Safe',
                      style: GoogleFonts.sail(
                          fontSize: 50, color: kDarkGreenColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 595,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: kSpiritedGreen,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 250,
                              height: 50,
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: _name == null ? 'User' : _name!,
                                        color: Colors.black,
                                        textSize: 16,
                                        // isTitle: true,
                                      ),
                                      // Text(
                                      //   _,
                                      //   style: TextStyle(
                                      //       fontSize: 14,
                                      //       fontWeight: FontWeight.bold,
                                      //       color: Colors.black),
                                      // ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      TextWidget(
                                        text:
                                            _email == null ? 'Email' : _email!,
                                        color: Colors.black,
                                        textSize: 16,
                                        // isTitle: true,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        listTile(
                          icon: Icons.file_copy_outlined,
                          title: 'Terms and conditions',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => termsscreen()));
                          },
                        ),
                        listTile(
                          icon: Icons.policy_outlined,
                          title: 'Privacy Policy',
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PrivacyPage()));
                          },
                        ),
                        listTile(
                          icon: Icons.add_chart,
                          title: 'About',
                          onPressed: () {},
                        ),
                        listTile(
                          icon: user == null
                              ? IconlyLight.login
                              : IconlyLight.logout,
                          title: user == null ? 'Login' : 'Log out',
                          onPressed: () {
                            if (user == null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                              );
                              return;
                            }
                            GlobalMethods.warningDialog(
                                title: 'Sign out',
                                subtitle: 'Do you wanna sign out?',
                                fct: () async {
                                  await authInstance.signOut();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                context: context);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, left: 40),
              child: CircleAvatar(
                backgroundColor: kSpiritedGreen,
                radius: 50,
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/17.jpg'), radius: 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
