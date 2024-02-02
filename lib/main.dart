import 'package:finger_print_app/views/all_prints.dart';
import 'package:finger_print_app/views/auth_screens/login_screen.dart';
import 'package:finger_print_app/views/home.dart';
import 'package:finger_print_app/views/splash_screen.dart';
import 'package:finger_print_app/views/started_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fingerprint Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  
      // FingerprintImageScreen()
      Splashscreen()
      // HomeScreen(),
    );
  }
}

