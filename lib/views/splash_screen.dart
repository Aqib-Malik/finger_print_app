import 'package:finger_print_app/views/auth_screens/login_screen.dart';
import 'package:finger_print_app/views/started_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}
class _SplashscreenState extends State<Splashscreen> {
    

  
  _navigatertohome()async{
    await Future.delayed(Duration(seconds:3),(){
       FirebaseAuth.instance.authStateChanges().listen((user) async{
        if (user != null) {

        
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
     
        } else {
          
          Get.offAll(() =>   LoginScreen());
        }
      }
      
      );

    });
    
       
   
  }
  @override
  void initState() {
    _navigatertohome();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
          backgroundColor: Color.fromARGB(255, 74, 79, 183),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/fingerpr.json', height: 200, width: 200),
               
              ],
            ),
          ),
        );
  }
}
