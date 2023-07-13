import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/screens/login_screen.dart';
import 'package:cropssafe/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding/onboarding.dart';

class Landing_page extends StatefulWidget {
  const Landing_page({Key? key}) : super(key: key);

  @override
  State<Landing_page> createState() => _Landing_pageState();
}

class _Landing_pageState extends State<Landing_page> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
          color: kSpiritedGreen,
          border: Border.all(
            width: 0,
            color: Color.fromARGB(26, 49, 230, 91),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
               SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 50,
                ),
                child: Image.asset(
                  'images/slide1.png',
                ),
              ),
             
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Crops Safe',
                    style:
                        GoogleFonts.sail(fontSize: 40, color: kDarkGreenColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "An All-in-One App to Help farmers making farming a lot easier.",
                      style: GoogleFonts.poppins(
                        color: kGreyColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 100)),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
          color: kSpiritedGreen,
          border: Border.all(
            width: 0,
            color: Color.fromARGB(26, 49, 230, 91),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 50,
                ),
                child: Image.asset(
                  'images/slide2.png',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Crops Safe',
                    style:
                        GoogleFonts.sail(fontSize: 40, color: kDarkGreenColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "The App helps to detect defected regions of crops so that necessary care can be taken.",
                      style: GoogleFonts.poppins(
                        color: kGreyColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 100)),
            ],
          ),
        ),
      ),
    ),
    PageModel(
      widget: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
          color: kSpiritedGreen,
          border: Border.all(
            width: 0,
            color: Color.fromARGB(26, 230, 240, 232),
          ),
        ),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
               SizedBox(
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 50,
                ),
                child: Image.asset('images/slide3.png'),
              ),
            
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 70,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Crops Safe',
                    style:
                        GoogleFonts.sail(fontSize: 40, color: kDarkGreenColor),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Smart Agriculture lets farmer know the live conditions of the crops.",
                      style: GoogleFonts.poppins(
                        color: kGreyColor,
                        fontSize: 15.0,
                      ),
                      textAlign: TextAlign.center,
                    )),
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 100))
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      borderRadius: defaultSkipButtonBorderRadius,
      color: defaultSkipButtonColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 2;
            setIndex(2);
          }
        },
        child: const Padding(
          padding: defaultSkipButtonPadding,
          child: Text(
            'Skip',
            style: defaultSkipButtonTextStyle,
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      borderRadius: defaultProceedButtonBorderRadius,
      color: defaultProceedButtonColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () {
           Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return SignupScreen();
                                    }));
        },
        child: const Padding(
          padding: defaultProceedButtonPadding,
          child: Text(
            'Sign up',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Onboarding(
            pages: onboardingPagesList,
            onPageChange: (int pageIndex) {
              index = pageIndex;
            },
            startPageIndex: 0,
            footerBuilder: (context, dragDistance, pagesLength, setIndex) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color:kSpiritedGreen
,                  border: Border.all(
                    width: 0.0,
                    color: background,
                  ),
                ),
                child: ColoredBox(
                  color:kSpiritedGreen,
                  child: Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomIndicator(
                          netDragPercent: dragDistance,
                          pagesLength: pagesLength,
                          indicator: Indicator(
                            indicatorDesign: IndicatorDesign.line(
                              lineDesign: LineDesign(
                                lineType: DesignType.line_uniform,
                              ),
                            ),
                          ),
                        ),
                        index == pagesLength - 1
                            ? _signupButton
                            : _skipButton(setIndex: setIndex)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
