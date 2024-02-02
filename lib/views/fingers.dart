// import 'dart:convert';
// import 'dart:async' show Future;
// import 'dart:typed_data';
// import 'package:biopassid_fingerprint_sdk/biopassid_fingerprint_sdk.dart';
// import 'package:finger_print_app/views/widgets/finger_tile.dart';
// import 'package:finger_print_app/views/widgets/header.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart' show rootBundle;


// class FingerScreen extends StatefulWidget {
//   final String title;
//   final Color primaryColor;
//   final Color secondaryColor;

//   FingerScreen({
//     required this.title,
//     required this.primaryColor,
//     required this.secondaryColor,
//   });

//   @override
//   _FingerScreenState createState() => _FingerScreenState();
// }

// class _FingerScreenState extends State<FingerScreen> {

//   int? _selectedIndex;

//   late FingerprintController controller;
//   List<List<Uint8List>> capturedFingerprints = [];
//   var statusText = 'Ready to capture';

//   @override
//   void initState() {
//     super.initState();

//     final config = FingerprintConfig(
//       licenseKey: 'H6YK-7YWL-5XEJ-V3FI',
//       showDistanceIndicatorView: true,
//       showFingerEllipseView: true,
//       captureType: FingerprintCaptureType.leftHandFingers,
//       outputType: FingerprintOutputType.captureAndSegmentation,
//       numberFingersToCapture: 1,
//       fontFamily: 'fingerprintsdk_opensans_regular',
//       overlayColor: const Color(0x80000000),
//       fingerColor: Color.fromARGB(128, 215, 171, 117),
//       distanceIndicatorLineColor: const Color(0xFFFFFFFF),
//       distanceIndicatorHighlightColor: const Color(0xFFD6A262),
//       helpText: FingerprintHelpTextOptions(
//         enabled: true,
//         messages: FingerprintHelpTextMessages(
//           leftHandMessage:
//               'Place your left hand (excluding the thumb)\nuntil the marker is centered.',
//           rightHandMessage:
//               'Place your right hand (excluding the thumb)\nuntil the marker is centered.',
//           thumbsMessage: 'Place thumbs until the marker is centered.',
//         ),
//         textColor: const Color(0xFFFFFFFF),
//         textSize: 14,
//       ),
//       tooCloseText: FingerprintTextOptions(
//         enabled: true,
//         content: 'Too close',
//         textColor: const Color(0xFFFFFFFF),
//         textSize: 14,
//       ),
//       tooFarText: FingerprintTextOptions(
//         enabled: true,
//         content: 'Too far',
//         textColor: const Color(0xFFFFFFFF),
//         textSize: 14,
//       ),
//       backButton: FingerprintButtonOptions(
//         enabled: true,
//         backgroundColor: const Color(0x00000000),
//         buttonPadding: 0,
//         buttonSize: const Size(56, 56),
//         iconOptions: FingerprintIconOptions(
//           enabled: true,
//           iconFile: 'fingerprint_ic_close',
//           iconColor: const Color(0xFFFFFFFF),
//           iconSize: const Size(32, 32),
//         ),
//         labelOptions: FingerprintTextOptions(
//           enabled: false,
//           content: 'Back',
//           textColor: const Color(0xFFFFFFFF),
//           textSize: 14,
//         ),
//       ),
//     );

//     controller = FingerprintController(
//       config: config,
//       onFingerCapture: (images, error) {
//         if (error != null) {
//           setState(() {
//             statusText = 'Error: $error';
//           });
//         } else {
//           setState(() {
//             statusText = 'Fingerprint captured successfully';
//             // Append the new set of fingerprints to the existing list
//             capturedFingerprints.add(images);
//           });
//         }
//       },
//       onStatusChanged: (FingerprintCaptureState state) {
//         setState(() {
//           statusText = 'Status: $state';
//         });
//       },
//       onFingerDetected: (List<Rect> fingerRects) {
//         print('onFingerDetected: $fingerRects');
//       },
//     );
//   }

//    takeFingerprint() async {
//     await controller.takeFingerprint();
//   }

//   void saveImage() {
//     // Implement the logic to save the captured fingerprint image
//     // You can use the capturedFingerprints list to get the image data
//     // and save it to a desired location.
//     // Example: File('path/to/save/image.png').writeAsBytes(capturedFingerprints[0][0]);
//   }


// @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           PageHeader(
//             title: widget.title,
//             primaryColor: widget.primaryColor,
//             secondaryColor: widget.secondaryColor,
//           ),
//           Expanded(
//             child: Column(
//               children: <Widget>[
//                 // Add a button to trigger fingerprint capture
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Open the camera when the button is pressed
//                     await takeFingerprint();
//                     // Ensure a rebuild after the fingerprint capture is complete
//                     setState(() {});
//                   },
//                   child: Text('Capture Fingerprint'),
//                 ),
//                 // Display captured fingerprints if available
//                 if (capturedFingerprints.isNotEmpty)
//                   Expanded(
//                     child: MediaQuery.removePadding(
//                       context: context,
//                       removeTop: true,
//                       child: GridView.builder(
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: 2,
//                           crossAxisSpacing: 20.0,
//                         ),
//                         itemCount: capturedFingerprints.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           print('object');
//                           return Padding(
//                             padding: index % 2 == 0
//                                 ? const EdgeInsets.only(bottom: 20, left: 20)
//                                 : const EdgeInsets.only(bottom: 20, right: 20),
//                             child: BodyPartTileCard(
//                               fontSizeBase: 50,
//                               fontSizeActive: 40,
//                               isActive: _selectedIndex == index,
//                               title: 'iiii',
//                               onTap: () {
//                                 setState(() {
//                                   _selectedIndex = index;
//                                 });
//                               },
//                               imagepath: capturedFingerprints[index][0],
//                               obect_image_path: 'assets/fingerpr.json',
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }  @override
//   void dispose() {
//     super.dispose();
//   }
// }
