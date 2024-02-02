import 'package:finger_print_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:lottie/lottie.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;
  final Widget screen;
  final IconData icon;
    final List<String> lottieAssetList; // Add this line for the list of Lottie assets


  CategoryCard({
    Key? key,
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
    required this.screen,
    required this.icon, required this.lottieAssetList,
  }) : super(key: key);

  void _navigate(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return screen;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BounceInUp(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 8),
              blurRadius: 16,
              color: Colors.grey[900]!.withOpacity(0.3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor,
              secondaryColor,
            ],
          ),
        ),
        height: 180.0,
        child: Material(
          type: MaterialType.transparency,
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: () {
              _navigate(context, screen);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Column(
                    children: [
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:lottieAssetList.map((asset) {
                        return asset.contains('json')? Lottie.asset(asset, height: 80, width: 90):Image.asset(asset, height: 70, width: 70);
                      }).toList()
                    ),
                      
                    ],
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      icon,
                      color: primaryColor,
                      size: 32,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: kHeadingTextStyle.copyWith(
                          fontSize: 28.0,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        softWrap: false,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Tap to explore",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
