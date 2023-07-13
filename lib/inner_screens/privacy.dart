import 'package:cropssafe/consts/constants.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kSpiritedGreen,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Container(
                      height: 100.0,
                      width: MediaQuery.of(context).size.width - 24.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2.0,
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2.0)
                          ]),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                'Privacy and Policy',
                                style: new TextStyle(
                                  fontFamily: "VT323",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 60, bottom: 20, left: 14, right: 14),
              child: Text(
                'Privacy Policy',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'Amod Mandal built the Cropsafe app as a Free app. This SERVICE is provided by Amod Mandal at no cost and is intended for use as is.This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Cropsafe unless otherwise defined in this Privacy Policy.',
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'Information Collection and Use',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way.The app does use third-party services that may collect information used to identify you.Link to the privacy policy of third-party service providers used by the appGoogle \n - Play ServicesGoogle \n - Analytics for Firebase\n - Facebook     ',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'Log Data',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'Cookies',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your devices internal memory.This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'Service Providers',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'I may employ third-party companies and individuals due to the following reasons: \n- To facilitate our Service.\n- To provide the Service on our behalf.\n - To perform Service-related services; or\n -To assist us in analyzing how our Service is used.\n\nI want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'Security',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'Links to Other Sites',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),
              Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 14, right: 14),
              child: Text(
                'Contact Us',
                style:
                    TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
              ),
            ),

            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
              child: Text(
                'If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at mandala573@gmail.com.',
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 17, fontFamily: 'Raleway'),
              ),
            ),

            // Padding(
            //   padding: EdgeInsets.only(top: 20, bottom: 20, left: 14, right: 14),
            //   child: Image.asset('assets/PotatoEarlyCycle.jpg'),

            // ),
            
          ],
        ));
  }

  Widget amenities(
    String url1,
    String url2,
    String url3,
    String features1,
    String features2,
    String features3,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url1,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features1)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url2,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features2)
              ],
            )),
        Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1.0),
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0.2)
                ]),
            child: Column(
              children: <Widget>[
                Image.asset(
                  url3,
                  fit: BoxFit.contain,
                  height: 40.0,
                  width: 40.0,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(features3)
              ],
            )),
      ],
    );
  }

  Widget about_hotel(
    String description,
  ) {
    return Padding(
        padding: EdgeInsets.only(left: 14, top: 6, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              description,
              style: TextStyle(fontSize: 20, fontFamily: 'ConcertOne-Regular'),
            ),
          ],
        ));
  }
}
