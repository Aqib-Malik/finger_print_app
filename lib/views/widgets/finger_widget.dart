import 'dart:typed_data';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class FingerprintCard extends StatelessWidget {
  final Uint8List fingerprintFrontImage;
  final Uint8List fingerprintBackImage;
  final VoidCallback onDeletePressed;
  final VoidCallback onUploadPressed;
  final BuildContext context;

  FingerprintCard({
    required this.fingerprintFrontImage,
    required this.fingerprintBackImage,
    required this.onDeletePressed,
    required this.onUploadPressed,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      front: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: Colors.black12,
                width: 150,
                height: 150,
                child: Image.memory(
                  fingerprintFrontImage,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.upload),
                    onPressed: onUploadPressed,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 40,),
                  IconButton(
                    icon: Icon(Icons.fullscreen),
                    onPressed: (){
                      _showFullScreenImage(context, fingerprintFrontImage);
                    },
                    color: Colors.green, // You can change the color as needed
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      back: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                color: Colors.black12,
                width: 150,
                height: 150,
                child: Image.memory(
                  fingerprintBackImage,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  IconButton(
                    icon: Icon(Icons.upload),
                    onPressed: onDeletePressed,
                    color: Colors.blue,
                  ),
                   SizedBox(width: 40,),
                  IconButton(
                    icon: Icon(Icons.fullscreen),
                    onPressed: (){_showFullScreenImage(context, fingerprintBackImage);},
                    color: Colors.green, // You can change the color as needed
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



   void _showFullScreenImage(BuildContext context, Uint8List imageData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Hero(
              tag: "fullScreenImage",
              child: Image.memory(
                imageData,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );}
}
