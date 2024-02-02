
import 'package:finger_print_app/views/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.94),
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor:Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
        
            	SimpleUserCard(
                imageRadius: 26,
              userName: "Finger Print Taker",
              userProfilePic: AssetImage("assets/fingerprint.png",),
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    // Open a privacy link
                    launch('https://www.google.com.pk/');
                  },
                  icons: Icons.fingerprint,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Privacy',
                  subtitle: "Finger Print Taker to improve your privacy",
                ),
                SettingsItem(
                  onTap: () {
                    // Share functionality
                 Share.share('check out my website https://example.com');
                  },
                  icons: Icons.share,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.blue,
                  ),
                  title: 'Share',
                  subtitle: "Share Finger Print Taker' App with friends",
                ),
              ],
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {
                    // Open Play Store for rating
                    launch('https://www.google.com.pk/');
                  },
                  icons: Icons.rate_review,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'Rate Us',
                  subtitle: "Rate Finger Print Taker on the Play Store",
                ),
              ],
            ),


             SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () async{
                    await FirebaseAuth.instance.signOut().then((value) => Get.offAll(Splashscreen()));
                   },
                  icons: Icons.logout,
                  iconStyle: IconStyle(
                    backgroundColor: Color.fromARGB(255, 75, 67, 220),
                  ),
                  title: 'Log out',
                  subtitle: "",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
