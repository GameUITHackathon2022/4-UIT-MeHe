// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// //import views
// import 'package:grow_app/views/authentication/signIn.dart';
// import 'package:grow_app/views/authentication/recoverypassword.dart';

// //import constants
// import 'package:grow_app/constants/colors.dart';
// import 'package:grow_app/constants/fonts.dart';
// import 'package:grow_app/constants/images.dart';
// import 'package:grow_app/constants/icons.dart';
// import 'package:grow_app/constants/others.dart';

// //import others
// import 'package:blur/blur.dart';

// class checkinEmailScreen extends StatelessWidget {
//   const checkinEmailScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//             padding: EdgeInsets.all(appPadding),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(backgroundAuthentication),
//                   fit: BoxFit.cover),
//             ),
//             child: Column(children: [
//               SizedBox(height: 100),
//               Container(
//                 alignment: Alignment.center,
//                 child: Image.asset(atCheckPerspective, scale: 1),
//               ),
//               SizedBox(height: 32),
//               Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Check in Your Mail!',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: title28,
//                       color: black,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     textAlign: TextAlign.center,
//                   )),
//               SizedBox(height: 8),
//               Container(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'We just emailed you with the reset link to' + '\n' + 'reset your password.',
//                     style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontSize: content14,
//                         color: black,
//                         fontWeight: FontWeight.w400,
//                         height: 1.6),
//                     textAlign: TextAlign.center,
//                   )
//               ),
//               SizedBox(height: 24),
//               Stack(children: [
//                 Container(
//                   padding: EdgeInsets.only(top: 10, left: 22),
//                   child: Stack(
//                     alignment: Alignment.topCenter,
//                     children: [
//                       Container(
//                         height: 54,
//                         width: 268,
//                         decoration: BoxDecoration(
//                           color: purpleDark.withOpacity(0.3),
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: black.withOpacity(0.25),
//                               spreadRadius: 0,
//                               blurRadius: 4,
//                               offset: Offset(0, 4),
//                             ),
//                             BoxShadow(
//                               color: black.withOpacity(0.1),
//                               spreadRadius: 0,
//                               blurRadius: 60,
//                               offset: Offset(10, 10),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Blur(
//                         blur: 10,
//                         blurColor: whiteLight.withOpacity(0.3),
//                         child: Container(
//                           height: 64,
//                           width: 278,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                     alignment: Alignment.center,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => signinScreen(),
//                           ),
//                         );
//                       },
//                       child: AnimatedContainer(
//                         alignment: Alignment.center,
//                         duration: Duration(milliseconds: 300),
//                         height: 54,
//                         width: 260,
//                         decoration: BoxDecoration(
//                           color: purpleDark,
//                           borderRadius: BorderRadius.circular(15),
//                           boxShadow: [
//                             BoxShadow(
//                               color: black.withOpacity(0.25),
//                               spreadRadius: 0,
//                               blurRadius: 4,
//                               offset: Offset(0, 4),
//                             ),
//                             BoxShadow(
//                               color: black.withOpacity(0.1),
//                               spreadRadius: 0,
//                               blurRadius: 60,
//                               offset: Offset(10, 10),
//                             ),
//                           ],
//                         ),
//                         child: Text(
//                           "Come Back to Login",
//                           style: TextStyle(
//                               color: white,
//                               fontFamily: 'Poppins',
//                               fontWeight: FontWeight.w600,
//                               fontSize: textButton),
//                         ),
//                       ),
//                     )
//                 ),
//               ]
//               ),
//               SizedBox(height: 13),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Recovering another account? ',
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: suggestion12,
//                       color: greyDark,
//                       fontWeight: FontWeight.w500,
//                       height: 1.6
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => recoveryScreen(),
//                         ),
//                       );
//                     },
//                     child: Text(
//                       'Recover now!', style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: suggestion12,
//                           color: purpleDark,
//                           fontWeight: FontWeight.w600,
//                           height: 1.6
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ]
//           )
//         )
//     );
//   }
// }
