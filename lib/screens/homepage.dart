import 'dart:convert';
import 'dart:io';

import 'package:cropssafe/consts/constants.dart';
import 'package:cropssafe/inner_screens/greeting.dart';
import 'package:cropssafe/inner_screens/image.dart';
import 'package:cropssafe/inner_screens/instructions.dart';
import 'package:cropssafe/inner_screens/titlesection.dart';
import 'package:cropssafe/screens/predictionpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../consts/global_methods.dart';
import '../inner_screens/predictionbutton.dart';

// ignore: camel_case_types
class Home_page extends StatefulWidget {
  Home_page({Key? key}) : super(key: key);
  static const String id = 'LoginScreen';
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  File? _image;
  String? _response;
  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final img = File(image.path);

      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future<void> sendImageToServer(File image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:8000/predict'),
    );
    request.files.add(
      await http.MultipartFile.fromPath('file', image.path),
    );

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
      var responseBody = await response.stream.bytesToString();
      print(responseBody);
      var jsonResponse = json.decode(responseBody);
      print(jsonResponse['error']);
      if (jsonResponse['error'] ==
          'Please provide valid images of either potato or apple leaf') {
        String error = jsonResponse['error'];
        GlobalMethods.errorDialog(subtitle: '$error', context: context);
      } else {
        String predictedClass = jsonResponse['class'];
        double confidence = jsonResponse['confidence'];
        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PredictionPage(
                predictionclass: predictedClass,
                confidence: confidence * 100,
              ),
            ));
        _response = null; // Reset the response when a new image is selected
        setState(() {
          _response = 'Prediction: $predictedClass\nConfidence: $confidence';
          print('Prediction: $predictedClass');
          print('Confidence: $confidence');
        });
      }
    } else {
      print('Image upload failed with status: ${response.statusCode}');
    }
  }

  void predictImage() {
    if (_image != null) {
      sendImageToServer(_image!);
    } else {
      GlobalMethods.errorDialog(
          subtitle: 'No image selected', context: context);
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: SpeedDial(
          backgroundColor: kMain,
          icon: Icons.camera_alt,
          spacing: 10,
          children: [
            SpeedDialChild(
                child: FaIcon(
                  FontAwesomeIcons.file,
                  color: kWhite,
                ),
                label: "Choose image",
                backgroundColor: kMain,
                onTap: () {
                  _pickImage(ImageSource.gallery);
                }
                // async {
                //   late double _confidence;
                //   await classifier.getDisease(ImageSource.gallery).then((value) {
                //     _disease = Disease(
                //         name: value![0]["label"],
                //         imagePath: classifier.imageFile.path);

                //     _confidence = value[0]['confidence'];
                //   });
                //   // Check confidence
                //   if (_confidence > 0.8) {
                //     // Set disease for Disease Service
                //     _diseaseService.setDiseaseValue(_disease);

                //     // Save disease
                //     _hiveService.addDisease(_disease);

                //     Navigator.restorablePushNamed(
                //       context,
                //       Suggestions.routeName,
                //     );
                //   } else {
                //     // Display unsure message

                //   }
                // },
                ),
            SpeedDialChild(
                child: FaIcon(
                  FontAwesomeIcons.camera,
                  color: kWhite,
                ),
                label: "Take photo",
                backgroundColor: kMain,
                onTap: () {
                  _pickImage(ImageSource.camera);
                } //() async {
                //   late double _confidence;

                //   await classifier.getDisease(ImageSource.camera).then((value) {
                //     _disease = Disease(
                //         name: value![0]["label"],
                //         imagePath: classifier.imageFile.path);

                //     _confidence = value[0]['confidence'];
                //   });

                //   // Check confidence
                //   if (_confidence > 0.8) {
                //     // Set disease for Disease Service
                //     _diseaseService.setDiseaseValue(_disease);

                //     // Save disease
                //     _hiveService.addDisease(_disease);

                //     Navigator.restorablePushNamed(
                //       context,
                //       Suggestions.routeName,
                //     );
                //   } else {
                //     // Display unsure message

                //   }
                // },
                ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jpg'), fit: BoxFit.cover),
          ),
          child: CustomScrollView(
            slivers: [
              GreetingSection(size.height * 0.17),
              TitleSection('Instructions', size.height * 0.066),
              InstructionsSection(size),
              ImageSection(
                _image,
              ),
              SliverToBoxAdapter(
                child: PredictionButton(
                  onPressed: predictImage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
