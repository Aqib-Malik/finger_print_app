import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:finger_print_app/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PageHeader extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  const PageHeader({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  }) : super(key: key);

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> {
  HeaderController controller = Get.put(HeaderController());

  @override
  void initState() {
    super.initState();
    controller.imagepath.value = [];
    controller.image.value = '';
    controller.bg.value = '';
    controller.headertitle.value = this.widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Obx(()
        => Container(
          padding: EdgeInsets.only(left: 30, top: 60, right: 30),
          height: 330,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
               controller.bg.value!=''?Color(int.parse(controller.bg.value)): widget.primaryColor,
                 controller.bg.value!=''?Color(int.parse(controller.bg.value)):  widget.secondaryColor,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          controller.image.isNotEmpty?Align(
                alignment: Alignment.topCenter,
                child: Text(
                        controller.headertitle.value,
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
              ):SizedBox(),
              
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.white,
                  ),
                ),
              ),
              // SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 150,
                      alignment: Alignment.center,
                      child: Obx(() => controller.image.isNotEmpty
                          ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: 
                            controller.image.value.contains('json')? Lottie.asset(controller.image.value,height: 300,width: 300):Padding(
          padding: const EdgeInsets.all(8.0),
          child:     
          controller.image.value.contains('ear') || controller.image.value.contains('eye') || controller.image.value.contains('arm') || controller.image.value.contains('leg') ?
   
   
   
   Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
     CachedNetworkImage(
      height: 70,
      width: 70,
  imageUrl: controller.image.value,
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
), CachedNetworkImage(
  height: 70,
  width: 70,
  imageUrl: controller.image.value,
  imageBuilder: (context, imageProvider) => Transform(
    alignment: Alignment.center,
    transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          // fit: BoxFit.cover,
          // colorFilter:
          //     ColorFilter.mode(Colors.red, BlendMode.colorBurn)
        ),
      ),
    ),
  ),
  placeholder: (context, url) => Center(
    child: SpinKitChasingDots(
      color: Colors.blue,
      size: 30.0,
    ),
  ),
  errorWidget: (context, url, error) => Icon(Icons.error),
)

   ],):
   
          CachedNetworkImage(
  imageUrl: controller.image.value,
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
          // Image.network(controller.image.value)
          
          ),
                            // SlideInLeft(
                            //   child: Column(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children:
                            //         chunkRows(buildImageWidgets(), 6),
                            //   ),
                            // ),
                          )
                          :controller.imagepath.isNotEmpty? 
                          SlideInLeft(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:
                                    chunkRows(buildImageWidgets(), 6),
                              ),
                            ):
                            Text(
                              controller.headertitle.value,
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                            )),
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

  List<Widget> buildImageWidgets() {
    return controller.imagepath.map((path) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Image.asset(path, width: 40, height: 40),
      );
    }).toList();
  }

  List<Widget> chunkRows(List<Widget> widgets, int chunkSize) {
    List<Widget> rows = [];
    for (int i = 0; i < widgets.length; i += chunkSize) {
      int end = (i + chunkSize < widgets.length) ? i + chunkSize : widgets.length;
      rows.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets.sublist(i, end),
        ),
      ));
    }
    return rows;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height + 0, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
