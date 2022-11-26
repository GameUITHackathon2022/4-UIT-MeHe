// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// //import views
// import 'package:grow_app/views/authentication/recoveryPassword.dart';

// //import constants
// import 'package:grow_app/constants/colors.dart';
// import 'package:grow_app/constants/fonts.dart';
// import 'package:grow_app/constants/images.dart';
// import 'package:grow_app/constants/icons.dart';
// import 'package:grow_app/constants/others.dart';

// //import others
// import 'package:blur/blur.dart';

// class instructionScreen extends StatelessWidget {
//   const instructionScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           body: Container(
//                 padding: EdgeInsets.all(appPadding),
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(backgroundAuthentication),
//                       fit: BoxFit.cover),
//                 ),
//                 child: Column(children: [
//                   SizedBox(height: 82),
//                   Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Instruction Manual',
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: title28,
//                           color: purpleDark,
//                           fontWeight: FontWeight.w600,
//                         ),
//                         textAlign: TextAlign.center,
//                       )),
//                   SizedBox(height: 32),
//                   Container(
//                     padding: EdgeInsets.only(left: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               'To be able to recover your password, please follow these steps with us:',
//                               style: TextStyle(
//                                   fontFamily: 'Poppins',
//                                   fontSize: content16,
//                                   color: black,
//                                   fontWeight: FontWeight.w400,
//                                   height: 1.6),
//                               textAlign: TextAlign.left,
//                             )),
//                         SizedBox(height: 16),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                     fontFamily: 'Poppins',
//                                     fontSize: content16,
//                                     color: black,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.6),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                     text: 'Step 1: ',
//                                     style: TextStyle(
//                                       color: purpleDark,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text:
//                                         'Entering your registered email in the textfield.',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                     fontFamily: 'Poppins',
//                                     fontSize: content16,
//                                     color: black,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.6),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                     text: 'Step 2: ',
//                                     style: TextStyle(
//                                       color: purpleDark,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: 'Pressing the ',
//                                   ),
//                                   TextSpan(
//                                     text: 'Recovery Password ',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: 'button to recover the password.',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                     fontFamily: 'Poppins',
//                                     fontSize: content16,
//                                     color: black,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.6),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                     text: 'Step 3: ',
//                                     style: TextStyle(
//                                       color: purpleDark,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text:
//                                         'Accessing email address you’ve used to register and check it!',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                     fontFamily: 'Poppins',
//                                     fontSize: content16,
//                                     color: black,
//                                     fontWeight: FontWeight.w400,
//                                     height: 1.6),
//                                 children: const <TextSpan>[
//                                   TextSpan(
//                                     text: 'Step 4: ',
//                                     style: TextStyle(
//                                       color: purpleDark,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text:
//                                         'Clicking on a reset link in the mail and entering new password.',
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 32),
//                   Divider(
//                     color: greyDark,
//                     thickness: 0.5,
//                     indent: 25,
//                     endIndent: 25,
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               'For any questions or problems' +
//                                   '\n' +
//                                   'please email us at',
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: content16,
//                                 color: greyDark,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                               textAlign: TextAlign.center,
//                             )),
//                         SizedBox(height: 16),
//                         Container(
//                             alignment: Alignment.center,
//                             child: Text(
//                               'HelpGrow@gmail.com',
//                               style: TextStyle(
//                                 fontFamily: 'Poppins',
//                                 fontSize: content16,
//                                 color: purpleDark,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                               textAlign: TextAlign.center,
//                             )),
//                       ],
//                     ),
//                   ),
//                   Stack(
//                     children: [
//                       Container(
//                       padding: EdgeInsets.only(top: 36, left: 22),
//                       child: Stack(
//                         alignment: Alignment.topCenter,
//                         children: [
//                           Container(
//                             height: 54,
//                             width: 268,
//                             decoration: BoxDecoration(
//                               color: purpleDark.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: black.withOpacity(0.25),
//                                   spreadRadius: 0,
//                                   blurRadius: 4,
//                                   offset: Offset(0, 4),
//                                 ),
//                                 BoxShadow(
//                                   color: black.withOpacity(0.1),
//                                   spreadRadius: 0,
//                                   blurRadius: 60,
//                                   offset: Offset(10, 10),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Blur(
//                             blur: 10,
//                             blurColor: whiteLight.withOpacity(0.3),
//                             child: Container(
//                               height: 64,
//                               width: 278,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                         padding: EdgeInsets.only(top: 26),
//                         alignment: Alignment.center,
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pop(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => recoveryScreen(),
//                               ),
//                             );
//                           },
//                           child: AnimatedContainer(
//                             alignment: Alignment.center,
//                             duration: Duration(milliseconds: 300),
//                             height: 54,
//                             width: 260,
//                             decoration: BoxDecoration(
//                               color: purpleDark,
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: black.withOpacity(0.25),
//                                   spreadRadius: 0,
//                                   blurRadius: 4,
//                                   offset: Offset(0, 4),
//                                 ),
//                                 BoxShadow(
//                                   color: black.withOpacity(0.1),
//                                   spreadRadius: 0,
//                                   blurRadius: 60,
//                                   offset: Offset(10, 10),
//                                 ),
//                               ],
//                             ),
//                             child: Text(
//                               "Done!",
//                               style: TextStyle(
//                                   color: white,
//                                   fontFamily: 'Poppins',
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: textButton),
//                             ),
//                           ),
//                         )
//                     )
//                     ]
//                   )
//                 ]
//               )
//           )
//     );
//   }
// }
