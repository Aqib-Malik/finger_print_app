import 'package:finger_print_app/views/all_prints.dart';
import 'package:finger_print_app/views/fingers.dart';
import 'package:finger_print_app/views/home.dart';
import 'package:finger_print_app/views/right_hand_finger_print.dart';
import 'package:finger_print_app/views/setting_screen.dart';
import 'package:finger_print_app/views/thumbPrint.dart';
import 'package:finger_print_app/views/widgets/cat_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
// import 'package:animations/animations.dart';
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
          @override
  void initState() {
    super.initState();
  }


  final List<Widget> _categories = [
    //Objects
  //    CategoryCard(
  //     lottieAssetList: [
  //   'assets/data/lootie/objects/bed.json',
  //   'assets/data/lootie/objects/house.json',
  //   'assets/data/lootie/objects/clock.json',
  //   // 'assets/data/lootie/objects/door.json',
  //   // Add more assets as needed
  // ],
  //     title: 'Ibikoresho',
  //       primaryColor: Color(0xFF3383CD),
  //       secondaryColor: Color(0xFF11249F),
  //     screen: Container(
  //     ),
  //     icon: Icons.apps
  //   ),

       // numbers
  //    CategoryCard(
  //     lottieAssetList: [
  //  'assets/alphabets/1.png',
  //   'assets/alphabets/2.png',
  //   'assets/alphabets/3.png',
  // ],
  //     icon: Icons.format_list_numbered_rounded,
  //     title: 'Imibare',
  
  //      primaryColor: const Color.fromARGB(255, 255, 82, 169),
  //     secondaryColor: const Color.fromARGB(255, 244, 54, 136),
  //     screen: CountingScreen(
  //       title: 'Imibare',
    
  //        primaryColor: const Color.fromARGB(255, 255, 82, 169),
  //     secondaryColor: const Color.fromARGB(255, 244, 54, 136),
  //     ),
  //   ),
    
   




    // Colors
    CategoryCard(
      lottieAssetList: [
    'assets/fingerpr.json'
  ],
      
      title: 'Left Hand Fingers',
  
      primaryColor: Colors.redAccent,
      secondaryColor: Colors.red,
      screen: MyHomePage(
        title: 'Left Hand Fingers Print',
  
      primaryColor: Colors.redAccent,
      secondaryColor: Colors.red,
      ), icon: Icons.fingerprint_sharp
    ),
  
  CategoryCard(
      lottieAssetList: [
    'assets/fingerpr.json'
  ],
      
      title: 'Right Hand Fingers',
  
      primaryColor: Color(0xFF3383CD),
        secondaryColor: Color(0xFF11249F),
      screen: RightHandFinger(title: 'Right Hand Fingers', primaryColor: Color(0xFF3383CD), secondaryColor: Color(0xFF11249F),
      ), icon: Icons.photo
    ),
     CategoryCard(
      lottieAssetList: [
    'assets/fingerpr.json'
  ],
      
      title: 'Thumb Print',
  
     primaryColor: Colors.orangeAccent,
      secondaryColor: Colors.orange,
      screen: ThumbPrint(title: 'Thumb Print',   primaryColor: Colors.orangeAccent,
      secondaryColor: Colors.orange,
      ), icon: Icons.photo
    ),
  
     CategoryCard(
      lottieAssetList: [
    'assets/fingerpr.json'
  ],
      
      title: 'All Prints',
  
     primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      screen: AllPrints(title: 'All Prints',  primaryColor: Color(0xFF3383CD),
      secondaryColor: Color(0xFF11249F),
      ), icon: Icons.photo
    ),
  






  //   // BodyPartsScreen
  //   CategoryCard(
  //     lottieAssetList: [
  //   'assets/data/lootie/eye.json',
  //   'assets/data/lootie/nose.json',
  //   'assets/data/lootie/teeth.json',
  //   // Add more assets as needed
  // ],
  //     title: "Ibice by'umubiri",
      
  //     primaryColor: Colors.redAccent,
  //     secondaryColor: Colors.red,
      
  //     screen: BodyPartsScreen(
  //       title: "Ibice by'umubiri",
        
  //       primaryColor: Colors.redAccent,
  //       secondaryColor: Colors.red,
  //     ), icon: Icons.boy_rounded,
  //   ),




  //   // veg & fruit
  //    CategoryCard(
  //     lottieAssetList: [
  //  'assets/images/fruits.json',
  //   // Add more assets as needed
  // ],
  //     title: 'Imboga & Imbuto',
  //        primaryColor: Colors.orangeAccent,
  //     secondaryColor: Colors.orange,
      
  //     screen: VegFruitScreen(
  //       title: 'Imboga & Imbuto',
        
  //          primaryColor: Colors.orangeAccent,
  //       secondaryColor: Colors.orange,
  //     ), icon: Icons.apple_sharp,
  //   ),
  //   //Animals
  //    CategoryCard(
  //     lottieAssetList: [
  //   'assets/data/lootie/animal/lion.json',
  //   // 'assets/data/lootie/animal/elephant.json',
  //   'assets/data/lootie/animal/dog.json'
  //   // Add more assets as needed
  // ],
  //     title: 'Inyamaswa',
  //       primaryColor: Colors.greenAccent,
  //       secondaryColor: Colors.green,
  //     screen: AnimalsScreen(
  //       title: 'Inyamaswa',
  //   primaryColor: Colors.greenAccent,
  //       secondaryColor: Colors.green,
  //     ),
  //     icon: Icons.pets_sharp
  //   ),
  //   // abc
    CategoryCard(
      lottieAssetList: [
    'assets/setting.png',
    // Add more assets as needed
  ],
      title: 'Settings',
      primaryColor: Colors.purpleAccent,
      secondaryColor: Colors.purple,
      screen: SettingScreen(
      ),
      icon: Icons.settings
    ),
    // CategoryCard(
  //     lottieAssetList: [
  //   'assets/data/lootie/objects/bed.json',
  //   'assets/data/lootie/objects/house.json',
  //   'assets/data/lootie/objects/clock.json',
  //   'assets/data/lootie/objects/door.json',
  //   // Add more assets as needed
  // ],
    //   title: 'Stories',
      // primaryColor: Color(0xFF3383CD),
      // secondaryColor: Color(0xFF11249F),
    //   screen: StoriesScreen(
    //     title: 'Stories',
    //     primaryColor: Color(0xFF3383CD),
    //     secondaryColor: Color(0xFF11249F),
    //   ),
    //   icon: Icons.smart_toy_rounded
    // ),
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            image: DecorationImage(
                  image: AssetImage('assets/bg-bottom.png'),
                  alignment: Alignment.bottomCenter,
                            ),
                          ),
                          child: Container(
                            child: CustomScrollView(
                              slivers: <Widget>[
                                            SliverAppBar(
                                              expandedHeight: 300.0,
                                              backgroundColor: Colors.grey[50],
                                              flexibleSpace: FlexibleSpaceBar(
                                                background: Padding(
                                                  padding: const EdgeInsets.all(14.0),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Image.asset('assets/fingerprint.png',
                                                      fit: BoxFit.fill,
                                                      alignment: Alignment.topCenter,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SliverList(
                                              delegate: SliverChildListDelegate(_categories),
                                            ),
                              ],
                            ),
                          ),
                        ),
                ),
              );}
      
}











