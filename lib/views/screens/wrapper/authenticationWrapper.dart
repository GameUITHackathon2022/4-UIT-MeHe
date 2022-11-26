// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// //import views
// import 'package:grow_app/views/authentication/signIn.dart';
// import 'package:grow_app/views/wrapper/navigationBar.dart';

// //import controllers
// import 'package:grow_app/controllers/authController.dart';

// //import firebase
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// //import provider - state management
// import 'package:provider/provider.dart';

// class authenticationWrapper extends StatefulWidget {
//   @override
//   _authenticationWrapperState createState() => _authenticationWrapperState();
// }

// class _authenticationWrapperState extends State<authenticationWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<User?>(
//       // future: FirebaseAuth.instance.currentUser,
//       future: Future.value(auth.currentUser),
//       builder: (context, AsyncSnapshot<User?> snapshot) {
//         if (snapshot.hasData) {
//           // User? user = snapshot.data;
//           final User user = auth.currentUser!;
//           final String uid = user.uid;
//           return navigationBar(required, uid: user.uid);
//         } else {
//           return signinScreen();
//         }
//       },
//     );
//   }
// }
