import 'package:biopassid_fingerprint_sdk/biopassid_fingerprint_sdk.dart';
import 'package:finger_print_app/views/widgets/finger_tile.dart';
import 'package:finger_print_app/views/widgets/finger_widget.dart';
import 'package:finger_print_app/views/widgets/header.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:typed_data';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  MyHomePage({
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late FingerprintController controller;
  List<List<Uint8List>> capturedFingerprints = [];
  var statusText = 'Ready to capture';

  @override
  void initState() {
    super.initState();
  //    final config = FingerprintConfig(
  //     licenseKey: 'H6YK-7YWL-5XEJ-V3FI',
  //     showDistanceIndicatorView: true,
  //     showFingerEllipseView: true,
  //     captureType: FingerprintCaptureType.leftHandFingers,
  //     outputType: FingerprintOutputType.captureAndSegmentation,
  //     numberFingersToCapture: 1,
  //  helpText: FingerprintHelpTextOptions(
  //       enabled: true,
  //       messages: FingerprintHelpTextMessages(
  //         leftHandMessage:
  //             'Place your left hand (excluding the thumb)\nuntil the marker is centered.',
  //         rightHandMessage:
  //             'Place your right hand (excluding the thumb)\nuntil the marker is centered.',
  //         thumbsMessage: 'Place thumbs until the marker is centered.',
  //       ),
  //       textColor: const Color(0xFFFFFFFF),
  //       textSize: 14,
  //     ),
  //     tooCloseText: FingerprintTextOptions(
  //       enabled: true,
  //       content: 'Too close',
  //       textColor: const Color(0xFFFFFFFF),
  //       textSize: 14,
  //     ),
  //     tooFarText: FingerprintTextOptions(
  //       enabled: true,
  //       content: 'Too far',
  //       textColor: const Color(0xFFFFFFFF),
  //       textSize: 14,
  //     ),
  //     backButton: FingerprintButtonOptions(
  //       enabled: true,
  //       backgroundColor: const Color(0x00000000),
  //       buttonPadding: 0,
  //       buttonSize: const Size(56, 56),
  //       iconOptions: FingerprintIconOptions(
  //         enabled: true,
  //         iconFile: 'fingerprint_ic_close',
  //         iconColor: const Color(0xFFFFFFFF),
  //         iconSize: const Size(32, 32),
  //       ),
  //       labelOptions: FingerprintTextOptions(
  //         enabled: false,
  //         content: 'Back',
  //         textColor: const Color(0xFFFFFFFF),
  //         textSize: 14,
  //       ),
  //     ),
  //   );


    final config = FingerprintConfig(
      licenseKey: 'H6YK-7YWL-5XEJ-V3FI',
      showDistanceIndicatorView: true,
      showFingerEllipseView: true,
      captureType: FingerprintCaptureType.leftHandFingers,
      outputType: FingerprintOutputType.captureAndSegmentation,
      numberFingersToCapture: 1,
      fontFamily: 'fingerprintsdk_opensans_regular',
      overlayColor: const Color(0x80000000),
      fingerColor: Color.fromARGB(128, 215, 171, 117),
      distanceIndicatorLineColor: const Color(0xFFFFFFFF),
      distanceIndicatorHighlightColor: const Color(0xFFD6A262),
      helpText: FingerprintHelpTextOptions(
        enabled: true,
        messages: FingerprintHelpTextMessages(
          leftHandMessage:
              'Place your left hand finger (excluding the thumb)\nuntil the marker is centered.',
          rightHandMessage:
              'Place your right hand (excluding the thumb)\nuntil the marker is centered.',
          thumbsMessage: 'Place thumbs until the marker is centered.',
        ),
        textColor: const Color(0xFFFFFFFF),
        textSize: 14,
      ),
      tooCloseText: FingerprintTextOptions(
        enabled: true,
        content: 'Too close',
        textColor: const Color(0xFFFFFFFF),
        textSize: 14,
      ),
      tooFarText: FingerprintTextOptions(
        enabled: true,
        content: 'Too far',
        textColor: const Color(0xFFFFFFFF),
        textSize: 14,
      ),
      backButton: FingerprintButtonOptions(
        enabled: true,
        backgroundColor: const Color(0x00000000),
        buttonPadding: 0,
        buttonSize: const Size(56, 56),
        iconOptions: FingerprintIconOptions(
          enabled: true,
          iconFile: 'fingerprint_ic_close',
          iconColor: const Color(0xFFFFFFFF),
          iconSize: const Size(32, 32),
        ),
        labelOptions: FingerprintTextOptions(
          enabled: false,
          content: 'Back',
          textColor: const Color(0xFFFFFFFF),
          textSize: 14,
        ),
      ),
    );

    controller = FingerprintController(
      config: config,
      onFingerCapture: (images, error) {
        if (error != null) {
          setState(() {
            statusText = 'Error: $error';
             Fluttertoast.showToast(
  msg: "Try Again..($error)",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.CENTER,
  timeInSecForIosWeb: 1,
  backgroundColor: Colors.red,
  textColor: Colors.white,
  fontSize: 16.0
);
          });
        } else {
          setState(() {
            statusText = 'Fingerprint captured successfully';
            // Append the new set of fingerprints to the existing list
            capturedFingerprints.add(images);
          });
        }
      },
      onStatusChanged: (FingerprintCaptureState state) {
        setState(() {
          statusText = 'Status: $state';
        });
      },
      onFingerDetected: (List<Rect> fingerRects) {
        print('onFingerDetected: $fingerRects');
      },
    );
  }

  void takeFingerprint() async {
    await controller.takeFingerprint().whenComplete(() => print(statusText+'****************'));
  }

  void saveImage() {
    // Implement the logic to save the captured fingerprint image
    // You can use the capturedFingerprints list to get the image data
    // and save it to a desired location.
    // Example: File('path/to/save/image.png').writeAsBytes(capturedFingerprints[0][0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageHeader(
            title: widget.title,
            primaryColor: widget.primaryColor,
            secondaryColor: widget.secondaryColor,
          ),
             
              ElevatedButton(
                onPressed: takeFingerprint,
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 14, 101, 173),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4.0,
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.fingerprint,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Capture Fingers',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      
              SizedBox(height: 20),
      
              // Display captured fingerprints
// Display captured fingerprints
if (capturedFingerprints.isNotEmpty)
// SingleChildScrollView(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         for (int i = 0; i < capturedFingerprints.length; i++)
//           Container(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 10),
//                 Container(
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.0),
//                     color: Colors.grey[200],
//                   ),
//                   child: GridView.builder(
//                     shrinkWrap: true,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 8.0,
//                       mainAxisSpacing: 8.0,
//                     ),
//                     itemCount: capturedFingerprints[i].length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return FingerprintCard(
//             fingerprintBackImage: capturedFingerprints[i][index],
//             fingerprintFrontImage: capturedFingerprints[i][index],
//             onDeletePressed: (){},
//             onUploadPressed: (){},
//             context: context,
//           );
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Save Image Button
//               ],
//             ),
//           ),
//         Center(
//           child: ElevatedButton(
//             onPressed: saveImage,
//             style: ElevatedButton.styleFrom(
//               primary: Colors.blue,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               elevation: 4.0,
//             ),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     Icons.upload,
//                     color: Colors.white,
//                   ),
//                   SizedBox(width: 8.0),
//                   Text(
//                     'Upload Images',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16.0,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),

  SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height/2,
          child: 
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // Set the number of columns as needed
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
  ),
  shrinkWrap: true,
  itemCount: capturedFingerprints.length,
  itemBuilder: (BuildContext context, int i) {
    return 
      Column(
        children: [
          // SizedBox(height: 10),
          FingerprintCard(
            fingerprintBackImage: capturedFingerprints[i][0],
            fingerprintFrontImage: capturedFingerprints[i][0],
            onDeletePressed: (){},
            onUploadPressed: (){uploadImageToFirebase(capturedFingerprints[i][0],FirebaseAuth.instance.currentUser!.uid);},
            context: context,
          ),
          SizedBox(height: 20)
        ],
      );
    
  },
),

        ),
      ],
    ),
  ),

            ],
          ),
        ),
      ),
    );
  }



  Future<void> uploadImageToFirebase(Uint8List imageBytes, String userId) async {
  try {
    final String fileName = 'fingerprint_$userId.png';
    final firebase_storage.Reference reference =
        firebase_storage.FirebaseStorage.instance.ref().child(fileName);

    final firebase_storage.UploadTask uploadTask =
        reference.putData(imageBytes);

    // Wait for the upload to complete
    await uploadTask.whenComplete(() async {
      // Get the download URL
      final String downloadURL = await reference.getDownloadURL();

      // Add a new document to Firebase Firestore
      await FirebaseFirestore.instance
          .collection('fingerprintImages') // Replace with your collection name
          .add({
            'userId': userId,
            'fingerprintURL': downloadURL,
            'timestamp': FieldValue.serverTimestamp(),
          });

      // Display a success message to the user
      Fluttertoast.showToast(
        msg: 'Image uploaded Successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    });
  } catch (error) {
    print('Error uploading image: $error');
    // Handle the error, display a message to the user, etc.
  }
}


}
