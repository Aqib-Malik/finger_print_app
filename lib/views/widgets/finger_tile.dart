import 'dart:typed_data';

import 'package:finger_print_app/constant.dart';
import 'package:finger_print_app/controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BodyPartTileCard extends StatefulWidget {
  final bool isActive;
  final String title;
  final  obect_image_path;
  final String imagepath;
  final Color backgroundColor;
  final double fontSizeBase;
  final double fontSizeActive;
  final VoidCallback onTap;

  const BodyPartTileCard({
    Key? key,
    this.isActive = false,
    required this.title,
    this.backgroundColor = Colors.white,
    this.fontSizeBase = 130,
    this.fontSizeActive = 170,
    required this.onTap,
    required this.imagepath, required this.obect_image_path,
  }) : super(key: key);

  @override
  State<BodyPartTileCard> createState() => _BodyPartTileCardState();
}

class _BodyPartTileCardState extends State<BodyPartTileCard> {
  bool isPlaying = false;

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
  height: 150,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: widget.backgroundColor,
    boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          ),
    ],
    // image: DecorationImage(
    //       image: AssetImage(this.widget.obect_image_path),
    //       fit: BoxFit.cover, // Adjust the fit based on your needs
    // ),
  ),
  child:CachedNetworkImage(
  imageUrl: this.widget.imagepath,
  imageBuilder: (context, imageProvider) => Container(
  decoration: BoxDecoration(
    image: DecorationImage(
        image: imageProvider,
        // fit: BoxFit.cover,
        // colorFilter:
        //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
        ),
  ),
  ),
  placeholder: (context, url) => Center(child: SpinKitChasingDots(
  color: Colors.blue,
  size: 30.0,
)),
  errorWidget: (context, url, error) => Icon(Icons.error),
),
),

// Positioned(
//   right: 4,
//   top: 4,
  
//   child: Icon(Icons.delete_forever,size: 30,)),
  Positioned(
    right: 2,
    bottom: 40,
    
    child: IconButton(
                    icon: Icon(Icons.fullscreen),
                    onPressed: (){
                      _showFullScreenImage(context, this.widget.imagepath);
                    },
                    color: Colors.green, // You can change the color as needed
                  ))
        ],
      );
  }


  
   void _showFullScreenImage(BuildContext context, String imageData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Hero(
              tag: "fullScreenImage",
              child: Image.network(
                imageData,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );}

  // List<Widget> buildImageWidgets() {
  //   return widget.imagepath.map((path) {
  //     return Image.network(widget.imagepath, width: 30, height: 30);
  //   }).toList();
  // }

  // List<Widget> chunkRows(List<Widget> widgets, int chunkSize) {
  //   List<Widget> rows = [];
  //   for (int i = 0; i < widgets.length; i += chunkSize) {
  //     int end = (i + chunkSize < widgets.length) ? i + chunkSize : widgets.length;
  //     rows.add(Padding(
  //       padding: const EdgeInsets.all(4.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: widgets.sublist(i, end),
  //       ),
  //     ));
  //   }
  //   return rows;
  // }

}








    // {
    //   "code": "0xccffffff",
    //   "name": "Amano",
    //   "audio": "https://firebasestorage.googleapis.com/v0/b/kinyarwanda-app.appspot.com/o/body_parts%2Ftoes.wav?alt=media&token=75ea2163-eb88-4405-85a2-ba263d0d0726",
    //   "obect_image_path":"assets/data/lootie/eye.json",
    //   "imagePath": [
    //     "assets/alphabets/u.png",
    //     "assets/alphabets/m.png",
    //     "assets/alphabets/w.png",
    //     "assets/alphabets/e.png",
    //     "assets/alphabets/r.png",
    //     "assets/alphabets/u.png"
    //   ]
    // },