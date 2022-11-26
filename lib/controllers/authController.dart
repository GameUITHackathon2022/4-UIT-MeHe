import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import login method
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

//import others
import 'dart:math';

import 'package:hackathon2022/views/widgets/snackBarWidget.dart';

import '../views/screens/authentication/checkinEmail.dart';

FirebaseAuth auth = FirebaseAuth.instance;
// int randomNumber = Random().nextInt(9000) + 1000;

Future registerUser(String email, String password, String name,
    String phoneNumber, context) async {
  try {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      final User? user = auth.currentUser;
      final uid = user?.uid;
      // print("Your current id is $uid");
      //store user data to firestore

      FirebaseFirestore.instance.collection("users").doc(uid).set({
        'name': name,
        'email': email,
        "userId": uid,
        'phonenumber': phoneNumber,
        'dob': '',
        'job': 'Freelancer',
        'avatar': "https://i.imgur.com/YtZkAbe.jpg",
      }).then((signedInUser) => {
            print("successfully registered!"),
          });
      loginUser(email, password, context);
    });
  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code) {
      case "operation-not-allowed":
        showSnackBar(context, "Anonymous accounts are not enabled!", 'error');
        break;
      case "weak-password":
        showSnackBar(context, "Your password is too weak!", 'error');
        break;
      case "invalid-email":
        showSnackBar(context, "Your email is invalid, please check!", 'error');
        break;
      case "email-already-in-use":
        showSnackBar(context, "Email is used on different account!", 'error');
        break;
      case "invalid-credential":
        showSnackBar(context, "Your email is invalid, please check!", 'error');
        break;

      default:
        showSnackBar(context, "An undefined Error happened.", 'error');
    }
  }
}

Future<void> changePassword(currentPassword, newPassword, context) async {
  final user = FirebaseAuth.instance.currentUser!;
  try {
    try {
      var authResult = await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(
          email: (user.email).toString(),
          password: currentPassword,
        ),
      );
      user.updatePassword(newPassword).then((_) {
        showSnackBar(context, 'Successfully changed password!', 'success');
        Navigator.pop(context);
      }).catchError((error) {
        showSnackBar(context, 'Your current password is wrong!', 'error');
      });
      return null;
    } on FirebaseAuthException {
      showSnackBar(context, 'Your current password is wrong!', 'error');
    }
  } on FirebaseAuthException {
    showSnackBar(context, 'Your current password is wrong!', 'error');
  }
}

Future resetPasswordUser(String email, context) async {
  try {
    await auth.sendPasswordResetEmail(email: email).then((value) => {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => checkinEmailScreen(),
          //   ),
          // )
        });
  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code) {
      case "invalid-email":
        showSnackBar(context, "Your email is invalid, please check!", 'error');
        break;
      case "user-not-found":
        showSnackBar(
            context, "Your email is not found, please check!", 'error');
        break;

      default:
        showSnackBar(context, "An undefined Error happened.", 'error');
    }
  }
}

Future loginUser(String email, String password, context) async {
  try {
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print("successfully login!");
      final User? user = auth.currentUser;
      final uid = user?.uid;
      // print("Your current id is $uid");
      if (uid != null) {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => navigationBar(required, uid: uid)));
      }
    });
  } on FirebaseAuthException catch (e) {
    print(e.code);
    switch (e.code) {
      case "user-not-found":
        showSnackBar(
            context, "Your email is not found, please check!", 'error');
        break;
      case "wrong-password":
        showSnackBar(context, "Your password is wrong, please check!", 'error');
        break;
      case "invalid-email":
        showSnackBar(context, "Your email is invalid, please check!", 'error');
        break;
      case "user-disabled":
        showSnackBar(context, "The user account has been disabled!", 'error');
        break;
      case "too-many-requests":
        showSnackBar(
            context, "There was too many attempts to sign in!", 'error');
        break;
      case "operation-not-allowed":
        showSnackBar(context, "The user account are not enabled!", 'error');
        break;
      // // Preventing user from entering email already provided by other login method
      // case "account-exists-with-different-credential":
      //   showErrorSnackBar(context, "This account exists with a different sign in provider!");
      //   break;

      default:
        showSnackBar(context, "An undefined Error happened.", 'error');
    }
  }
}

Future signOutUser() async {
  await FirebaseAuth.instance
      .signOut()
      .then((value) => {print("successfully signout!")});
  await FacebookAuth.instance.logOut();
  final User? user = await auth.currentUser;
  final uid = user?.uid;
  // print("Your current id is $uid");
}

Future googleSignIn(context) async {
  try {
    final googleMethod = await GoogleSignIn().signIn();
    final auth = await googleMethod!.authentication;
    final cred = GoogleAuthProvider.credential(
        idToken: auth.idToken, accessToken: auth.accessToken);
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(cred)
        .whenComplete(() {});

    final User? googleUser = userCredential.user;
    final uid = googleUser?.uid;
    final GoogleSignInAccount? userData = googleMethod;

    print("Your current id is $uid");
    print("Your current email is " + userData!.email.toString());
    print("Your current photoUrl is " + userData.photoUrl.toString());
    print("Your current displayName is " + userData.displayName.toString());
    // print("Your current id is " + userData.id.toString());

    if (userCredential.additionalUserInfo!.isNewUser) {
      FirebaseFirestore.instance.collection("users").doc(uid).set({
        'name': userData.displayName,
        'email': userData.email,
        "userId": uid,
        'phonenumber': '',
        'dob': '',
        'avatar': userData.photoUrl,
        'job': '',
        'tasksList': FieldValue.arrayUnion([]),
        'messagesList': FieldValue.arrayUnion([]),
        'projectsList': FieldValue.arrayUnion([]),
      }).then((signedInUser) => {
            print("successfully registered!"),
          });
    }
    if (uid != null) {
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => navigationBar(required, uid: uid)));
    }
  } catch (e) {
    print("error");
  }
}

Future facebookSignIn(context) async {
  try {
    final facebookMethod = await FacebookAuth.instance
        .login(permissions: ['public_profile', 'email']);
    if (facebookMethod.status == LoginStatus.success) {
      final cred =
          FacebookAuthProvider.credential(facebookMethod.accessToken!.token);
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(cred)
          .whenComplete(() {});

      final User? facebookUser = userCredential.user;
      final uid = facebookUser?.uid;
      final userData = await FacebookAuth.instance.getUserData();

      print("Your current id is $uid");
      print("Your current userData is $userData");
      print("Your current email is " + userData['email'].toString());
      print("Your current photoUrl is " +
          userData['picture']['data']['url'].toString());
      print("Your current displayName is " + userData['name'].toString());
      // print("Your current id is " + userData['id'].toString());

      if (userCredential.additionalUserInfo!.isNewUser) {
        FirebaseFirestore.instance.collection("users").doc(uid).set({
          'name': userData['name'],
          'email': userData['email'],
          "userId": uid,
          'phonenumber': '',
          'dob': '',
          'job': '',
          'avatar': userData['picture']['data']['url'],
          'tasksList': FieldValue.arrayUnion([]),
          'messagesList': FieldValue.arrayUnion([]),
          'projectsList': FieldValue.arrayUnion([]),
        }).then((signedInUser) => {
              print("successfully registered!"),
            });
      }
      if (uid != null) {
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => navigationBar(required, uid: uid)));
      }
    }
  } catch (e) {
    print("error");
  }
}
