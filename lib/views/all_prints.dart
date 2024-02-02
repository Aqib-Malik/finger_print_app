

import 'package:finger_print_app/views/widgets/finger_tile.dart';
import 'package:finger_print_app/views/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class AllPrints extends StatefulWidget {
  final String title;
  final Color primaryColor;
  final Color secondaryColor;

  AllPrints({
    required this.title,
    required this.primaryColor,
    required this.secondaryColor,
  });


  @override
  State<AllPrints> createState() => _AllPrintsState();
}

class _AllPrintsState extends State<AllPrints> {
    Future<List<String>> fetchFingerprintImageUrls() async {
  try {
    final QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance
            .collection('fingerprintImages')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();

    if (snapshot.docs.isNotEmpty) {
      // Retrieve all image URLs as Strings
      return snapshot.docs.map((doc) => doc.data()['fingerprintURL'] as String).toList();
    }
  } catch (error) {
    print('Error fetching fingerprint image URLs: $error');
    // Handle the error, display a message to the user, etc.
  }

  return [];
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
             
      
              SizedBox(height: 10),
              FutureBuilder<List<String>>(
        future: fetchFingerprintImageUrls(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No fingerprint images found.'));
          } else {
            return Container(
              height: Get.height/1.7,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns as needed
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle image tap if needed
                    },
                    child:

                    BodyPartTileCard(title: '', onTap: () {  }, imagepath: snapshot.data![index], obect_image_path: null,)
                    
                    
                    
                    //  Card(
                    //   elevation: 4.0,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(8.0),
                    //   ),
                    //   child: Image.network(
                    //     snapshot.data![index],
                    //     width: double.infinity,
                    //     height: 150,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  );
                },
              ),
            );
          }
        },
      ),
    

             
            ],
          ),
        ),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class FingerprintImageScreen extends StatelessWidget {
  

//   FingerprintImageScreen();

//   Future<List<String>> fetchFingerprintImageUrls() async {
//   try {
//     final QuerySnapshot<Map<String, dynamic>> snapshot =
//         await FirebaseFirestore.instance
//             .collection('fingerprintImages')
//             .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .get();

//     if (snapshot.docs.isNotEmpty) {
//       // Retrieve all image URLs as Strings
//       return snapshot.docs.map((doc) => doc.data()['fingerprintURL'] as String).toList();
//     }
//   } catch (error) {
//     print('Error fetching fingerprint image URLs: $error');
//     // Handle the error, display a message to the user, etc.
//   }

//   return [];
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Fingerprint Images'),
//       ),
//       body: 
// FutureBuilder<List<String>>(
//         future: fetchFingerprintImageUrls(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No fingerprint images found.'));
//           } else {
//             return GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // Set the number of columns as needed
//                 crossAxisSpacing: 8.0,
//                 mainAxisSpacing: 8.0,
//               ),
//               itemCount: snapshot.data!.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Handle image tap if needed
//                   },
//                   child: Card(
//                     elevation: 4.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     child: Image.network(
//                       snapshot.data![index],
//                       width: double.infinity,
//                       height: 150,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
